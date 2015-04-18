require "thor"

class Encryptor < Thor
  desc "cipher", "creates cipher"
  def cipher(rotation = 13)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  desc "encrypt_letter", "gives encrypted letter"
  def encrypt_letter(letter)
    cipher_for_rotation = cipher
    puts cipher_for_rotation[letter]
    cipher_for_rotation[letter]
  end

  desc "decrypt_letter", "gives decrypted letter"
  def decrypt_letter(letter)
    cipher_for_rotation = cipher(-13)
    cipher_for_rotation[letter]
  end

  desc "encrypt", "gives encrypted string"
  def encrypt(string)
    letters = string.split("")
    letters.map do |letter|
      encrypt_letter(letter)
    end.join
  end

  desc "decrypt", "gives decrypted string"
  def decrypt(string)
    letters = string.split("")
    letters.map do |letter|
      decrypt_letter(letter)
    end.join
  end

  desc "encrypt_file", "gives encrypted file"
  def encrypt_file(filename)
    input = File.open(filename, "r")
    text = input.read
    encrypted_text = encrypt(text)
    output_filename = "#{filename}.encrypted"
    output = File.open(output_filename, "w")
    output.write(encrypted_text)
    output.close
    input.close
  end

  desc "decrypt_file", "gives decrypted file"
  def decrypt_file(filename)
    input = File.open(filename, "r")
    text = input.read
    decrypted_text = decrypt(text)
    output_filename = filename.gsub("encrypted", "decrypted")
    output = File.open(output_filename, "w")
    output.write(decrypted_text)
    output.close
    input.close
  end

  desc "supported_characters", "gives a list of supported characters"
  def supported_characters
    (' '..'z').to_a
  end
end

Encryptor.start(ARGV)
