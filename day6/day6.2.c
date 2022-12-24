#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define A 'a'

int main() {
    unsigned int counts[26] = {0};
    unsigned int duplicates = 0;
    unsigned int index = 0;

    char queue[14];
    char *buffer = malloc(4096);

    memset(buffer, 0, 255);
    scanf("%s", buffer);

    for (int i = 0; i < 14; i++) {
        char character = buffer[i];
        queue[i] = character;
        if (counts[character - A]) {
            duplicates++;
        }
        counts[character - A]++;
    }

    int length = strlen(buffer);
    for (int i = 14; i < length; i++){
        char character = buffer[i];
        char left = queue[index];

        queue[index] = character;
        counts[left - A]--;

        if (counts[left - A]) {
            duplicates--;
        }
        if (counts[character - A]) {
            duplicates++;
        }

        if (!duplicates) {
            printf("End of message marker at position %d\n", i + 1);
            break;
        }
        
        counts[character - A]++;
        index = (index + 1) % 14;
    }
}
