#Week 1 Test

# For file with only numbers, you should only return one thing(i.e.the first 10 characters)

# For file with story,you NEED to return two things(i.e. a modified string AND a list)
#  you can return multiple values by simply return them separated by commas like the following
# def editor(fname):
#
#     return 'modifystring', [a,b,c,d]

# HINT: to call your function for the story.txt file, use the following command
# editor("./data/story.txt")
# return statement should be in the format below
# return 'modifystring', [a,b,c,d]


def editor(fname):
    #YOUR CODE STARTS HERE
    with open(fname, 'r') as file:
        content = file.read()
        
    if content.isdigit(): # File contains only numbers
        number = content[:10]
        return number
    
    else: # File contains a story
        # lower every word of string, remove \n
        new_text = content.lower().strip("\n")
        
        #split into words
        words=new_text.split()
        
        #count the frequency of each word
        word_counts={}
        for word in words:
            word_counts[word]=word_counts.get(word,0)+1
        
        # Sort the words based on their frequency in descending order
        sorted_words = sorted(word_counts.items(), key=lambda x: x[1], reverse=True)

        # Extract the top 5 most frequent words
        top_five = [word for word, _ in sorted_words[:5]]

    return new_text,top_five