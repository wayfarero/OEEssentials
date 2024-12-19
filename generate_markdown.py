import os
from bs4 import BeautifulSoup
import re

def generate_gitlab_anchor(text):
    """Generate a GitLab-compliant anchor from text."""
    return re.sub(r'[^a-z0-9\-]', '', text.lower().replace(' ', '-'))

def parse_html_to_markdown(html_path):
    with open(html_path, 'r', encoding='utf-8') as file:
        soup = BeautifulSoup(file, 'html.parser')
    
    # Extract class name and package
    package = soup.find('div', class_='pkg_class_name').get_text(strip=True) if soup.find('div', class_='pkg_class_name') else "Unknown Package"
    class_name = soup.find('div', class_='title_name').get_text(strip=True).replace("CLASS", "").strip()
    class_anchor = generate_gitlab_anchor(class_name)
    
    # Extract metadata
    purpose = soup.find(string='Purpose').find_next('span').get_text(strip=True) if soup.find(string='Purpose') else "No purpose provided"
    author = soup.find(string='Author(s)').find_next('span').get_text(strip=True) if soup.find(string='Author(s)') else "Unknown author"
    created = soup.find(string='Created').find_next('span').get_text(strip=True) if soup.find(string='Created') else "Unknown date"
    superclass = soup.find(string='Super Class').find_next('span').get_text(strip=True) if soup.find(string='Super Class') else "Unknown superclass"

    # Extract method summaries and assign GitLab-compliant anchor IDs based on method name
    methods = []
    method_details = []
    for row in soup.select('.table_summary tr'):
        method_link = row.select_one('.cell_data a')
        if method_link:
            full_method_signature = method_link.get_text(strip=True)  # Full method signature
            method_name = full_method_signature.split('(')[0].strip()  # Extract only the method name
            method_anchor = generate_gitlab_anchor(method_name)
            methods.append((full_method_signature, method_anchor))
            
            # Find method details in the separate div following the anchor
            anchor = soup.find('a', {'name': method_link['href'].split('#')[-1]})
            if anchor:
                detail_div = anchor.find_next_sibling('div')  # Look for the separate div that contains details
                if detail_div:
                    # Extract each field individually and handle cases where the field is missing
                    purpose = detail_div.find_next_sibling('div')
                    currentdiv = purpose
                    
                    purpose_match = re.search(r'Purpose</span>:\s*([\w\s]+)', str(purpose))
                    if purpose_match:    
                        purpose_text = purpose_match.group(1).strip()
                        purpose = purpose_text
                    else:
                        purpose = "No purpose provided"
                                            
                    return_type = currentdiv.find_next_sibling('div')
                    currentdiv = return_type
                    
                    returntype_match = re.search(r'Return type</span>:\s*([\w\s]+)', str(return_type))
                    if returntype_match:
                        return_type = re.sub(r'\s+', ' ', returntype_match.group(1).strip()).strip().replace('`', '')
                    else:
                        return_type = "Unknown return type"
                                           
                    modifiers = currentdiv.find_next_sibling('div')
                    currentdiv = modifiers
                    modifiers_match = re.search(r'Modifiers </span>:\s*([\w\s]+)', str(modifiers))
                    if modifiers_match:
                        modifiers = modifiers_match.group(1).strip()
                        modifiers = re.sub(r'\s+', ' ', modifiers).strip()
                    else:
                        modifiers = "Unknown return type"
                   
                    syntax = currentdiv.find_next_sibling('div')
                    currentdiv = syntax
                    
                    syntax = currentdiv.find_next_sibling('div')
                    params = []
                    formatted_parameters = []

                    while (syntax.name == "div"): 
                        soup2 = BeautifulSoup(str(syntax), 'html.parser')
                        parameters = soup2.find_all('div', class_='parameter')
                    
                        # Extract and format each parameter
                        
                        for param in parameters:
                            # Get the parameter name from <span class="parameter_code">
                            name = param.find('span', class_='parameter_code').get_text(strip=True)
                            
                            # Extract the type and description text
                            text = param.get_text(" ", strip=True).replace(name, "", 1).strip()
                            text = re.sub(r'\s+', ' ', text.replace('&nbsp;', ' ')).strip()
                            # Add the formatted line
                            formatted_parameters.append(f"{name} {text}")
                            params.append((name.strip(), text.strip()))      
                        syntax = syntax.find_next_sibling()
                    
                    # Append method details
                    method_details.append({
                        'name': method_name,
                        'signature': full_method_signature,
                        'anchor': method_anchor,
                        'purpose': purpose,
                        'return_type': return_type,
                        'modifiers': modifiers,
                        'syntax': syntax,
                        'parameters': params
                    })
    
    # Format markdown for the class with GitLab-compliant anchors
    markdown = f"## {class_name}\n\n"
    markdown += f"**Package:** {package}\n\n"
    markdown += f"### Purpose\n{purpose}\n\n"
    markdown += f"### Author(s)\n{author}\n\n"
    markdown += f"### Created\n{created}\n\n"
    markdown += f"### Super Class\n`{superclass}`\n\n---\n\n"
    markdown += f"### Methods\n\n#### Summary of Available Methods\n\n"
    
    # Method names with full signature links in summary
    for full_method_signature, method_anchor in methods:
        markdown += f"- [{full_method_signature}](#{method_anchor})\n"
    markdown += "\n---\n\n"
    
    # Method details section with GitLab-compliant anchors and method name headings
    for method in method_details:
        markdown += f"<a id=\"{method['anchor']}\"></a>\n"
        markdown += f"#### {method['name']}\n"
        markdown += f"- **Signature**: {method['signature']}\n"
        markdown += f"- **Purpose**: {method['purpose']}\n"
        markdown += f"- **Return type**: {method['return_type']}\n"
        markdown += f"- **Modifiers**: {method['modifiers']}\n"
   #     markdown += f"- **Syntax**: {method['syntax']}\n"
        if method['parameters']:
            markdown += "- **Parameters**:\n"
            for param_name, param_desc in method['parameters']:
                markdown += f"  - {param_name}: {param_desc}\n"
        markdown += "\n---\n\n"
    
    return markdown, class_anchor

def generate_markdown(root_dir):
    markdown_content = "# OEEssentialsUtils Documentation\n\n## Overview\nThis documentation provides an overview of the utilities and classes available in the `OEEssentialsUtils` library.\n\n---\n\n## Packages\n\n### Summary of Available Packages\n\n- [`Utils`](#utils)\n\n---\n\n## Utils\n\n### Classes in Utils\n\n"
    
    # Process each HTML file in the Utils folder
    utils_dir = os.path.join(root_dir, "Utils")
    class_files = [f for f in os.listdir(utils_dir) if f.endswith('.html')]
    class_descriptions = []
    for file_name in class_files:
        html_path = os.path.join(utils_dir, file_name)
        class_markdown, class_anchor = parse_html_to_markdown(html_path)
        markdown_content += f"- [{file_name.replace('.html', '')}](#{class_anchor})\n"
        class_descriptions.append(class_markdown)
    
    markdown_content += "\n---\n\n"
    
    # Append each class description after the list
    markdown_content += "\n".join(class_descriptions)
    
    return markdown_content

# Generate and save markdown file
output_markdown = generate_markdown("Doc")
with open("README.md", "w", encoding='utf-8') as md_file:
    md_file.write(output_markdown)

print("Documentation markdown file generated successfully!")
