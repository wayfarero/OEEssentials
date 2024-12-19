#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pcre.h>

long regex_match(const char *pattern, const char *string) {
    const char *error;
    int error_offset;
    int rc;
    pcre *re;
    int ovector[30]; // To store the offsets of matches

    // Compile the regular expression pattern
    re = pcre_compile(pattern, 0, &error, &error_offset, NULL);
    if (re == NULL) {
        fprintf(stderr, "PCRE compilation failed at offset %d: %s\n", error_offset, error);
        return -2; // Indicate compilation error
    }

    // Execute the regex
    rc = pcre_exec(re, NULL, string, (int)strlen(string), 0, 0, ovector, 30);
    if (rc < 0) {
        if (rc == PCRE_ERROR_NOMATCH) {
            pcre_free(re);
            return -1; // No match
        } else {
            fprintf(stderr, "PCRE execution error: %d\n", rc);
            pcre_free(re);
            return -2; // Indicate execution error
        }
    }

    // Match found
    pcre_free(re);
    return 0;
}