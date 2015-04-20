require 'minitest/autorun'
require_relative 'encryptor'

class EncryptorTest < MiniTest::Unit::TestCase
  def test_cipher_produces_correct_hash
    expected_cipher = {" "=>"-", "!"=>".", "\""=>"/", "#"=>"0", "$"=>"1",
                       "%"=>"2", "&"=>"3", "'"=>"4", "("=>"5", ")"=>"6",
                       "*"=>"7", "+"=>"8", ","=>"9", "-"=>":", "."=>";",
                       "/"=>"<", "0"=>"=", "1"=>">", "2"=>"?", "3"=>"@",
                       "4"=>"A", "5"=>"B", "6"=>"C", "7"=>"D", "8"=>"E",
                       "9"=>"F", ":"=>"G", ";"=>"H", "<"=>"I", "="=>"J",
                       ">"=>"K", "?"=>"L", "@"=>"M", "A"=>"N", "B"=>"O",
                       "C"=>"P", "D"=>"Q", "E"=>"R", "F"=>"S", "G"=>"T",
                       "H"=>"U", "I"=>"V", "J"=>"W", "K"=>"X", "L"=>"Y",
                       "M"=>"Z", "N"=>"[", "O"=>"\\", "P"=>"]", "Q"=>"^",
                       "R"=>"_", "S"=>"`", "T"=>"a", "U"=>"b", "V"=>"c",
                       "W"=>"d", "X"=>"e", "Y"=>"f", "Z"=>"g", "["=>"h",
                       "\\"=>"i", "]"=>"j", "^"=>"k", "_"=>"l", "`"=>"m",
                       "a"=>"n", "b"=>"o", "c"=>"p", "d"=>"q", "e"=>"r",
                       "f"=>"s", "g"=>"t", "h"=>"u", "i"=>"v", "j"=>"w",
                       "k"=>"x", "l"=>"y", "m"=>"z", "n"=>" ", "o"=>"!",
                       "p"=>"\"", "q"=>"#", "r"=>"$", "s"=>"%", "t"=>"&",
                       "u"=>"'", "v"=>"(", "w"=>")", "x"=>"*", "y"=>"+",
                       "z"=>","}

    encryptor = Encryptor.new
    assert_equal encryptor.cipher(13), expected_cipher
  end

  def test_encrypt_string
    encryptor = Encryptor.new

    assert_equal encryptor.encrypt("Hello", 13), "Uryy!"
  end

  def test_decrypt_string
    encryptor = Encryptor.new

    assert_equal encryptor.decrypt("Uryy!", 13), "Hello"
  end

  def test_supported_characters
    characters = [" ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+",
                  ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7",
                  "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C",
                  "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
                  "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[",
                  "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g",
                  "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
                  "t", "u", "v", "w", "x", "y", "z"]

    encryptor = Encryptor.new

    assert_equal encryptor.supported_characters, characters
  end
end
