
# Given a string s, return the longest prefix that is repeated somewhere else in the string. 
# For example, "abcdabejf" would return "ab" as "ab" starts at the beginning of the string
# and is repeated again later. Do not use the find method.

def longestPrefixRepeated(s):

    length = len(s)
    for i in range(length - 1, 0, -1):
        if s[:i] in s[i:]:
            return s[:i]
    return ""
    

print(longestPrefixRepeated("abcdabejf"))