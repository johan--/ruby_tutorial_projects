class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def decrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(-rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    letters = string.split("")
    letters.map do |letter|
      encrypt_letter(letter, rotation)
    end.join
  end

  def decrypt(string, rotation)
    letters = string.split("")
    letters.map do |letter|
      decrypt_letter(letter, rotation)
    end.join
  end

  def encrypt_file(filename, rotation)
    # Add this pseudocode into the method as comments:
    #
    # Create the file handle to the input file
    # Read the text of the input file
    # Encrypt the text
    # Create a name for the output file
    # Create an output file handle
    # Write out the text
    # Close the file
    #
    # You’ve seen all the components that you need here. Figure out how to
    # implement this method on your own. Here are a few notes to help you:
    #
    # Use the filename variable from the parameter with the File.open call.
    # Remember to specify the right read/write mode.
    # Just call the same method you did before to read the contents. You’ll need
    # to save this into a variable.
    # Call your .encrypt method passing in the text from step 2 and the rotation
    # parameter
    # Name the output file the same as the input file, but with ".encrypted" on
    # the end. So an input file named "sample.txt" would generate a file named
    # "sample.txt.encrypted". Store the name in a variable.
    # Create a new file handle with the name from step 4 and remember the
    # correct read/write mode.
    # Use the .write method like before.
    # Call .close on the output file handle
  end

  def decrypt_file(filename, rotation)
    input = File.open(filename, "r")

    output_filename = filename.gsub("encrypted", "decrypted")
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message,attempt)
    end
  end

=begin
Further Exercise

Real-Time Encryption

You want to start using your encryption in more of your communication. Writing your original message to a file, encrypting it, and opening the file requires a lot of effort. It is not well suited for small amounts of text like a chat message or text messages.

Create a system that will allow you to type a unencrypted message and have the encrypted version appear

Create a system that will allow you to type an encrypted message and have the unencrypted message appear

Password Protecting Your Encryptor

The encryptor program does a fair job at protecting your correspondence. The messages you send to and from your friends are safe from prying eyes. However, your security would be compromised if your encryptor code fell into the wrong hands.

Add a simple password prompt when running encryptor

Protect your simple password by using your encryption

Use Ruby’s MD5 Hash of the password and store that in the file

Use Ruby’s MD5 Hash to compare incoming password attempts to see if they match

Building Better a ROT

We saw how easy it was to break the encryption when we used a single rotation value. We could build better encryption if we used multiple rotations within the same document.

Pick three different numbers
Select three numbers that you can remember. These three numbers will be the three encryption rotations that we will cycle through as we encrypt each letter.

When encrypting each character, continue to cycle through the three numbers you selected as your encryption ROT value.
Encrypting each letter with a different rotation will make it hard for for someone to crack your messages. Even if they were able to figure out that you were using three different rotations they would still need to generate all possible outputs to see which one looked correct.

Assuming you are rotating through the same 91 characters, choosing three numbers would require a cracker to look through 753571 possible combinations to figure out what you wrote. Each number you add would make that amount increase even more!
=end
end

# http://tutorials.jumpstartlab.com/projects/encryptor.html
