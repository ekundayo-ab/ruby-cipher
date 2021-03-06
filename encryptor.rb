# A text encryptor
class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher(rotation)[letter]
  end

  def decrypt_letter(letter, rotation)
    cipher(rotation).key(letter)
  end

  def encrypt(string, rotation)
    letters = string.split('')
    letters.collect { |letter| encrypt_letter(letter, rotation) }.join
  end

  def decrypt(string, rotation)
    letters = string.split('')
    letters.collect { |letter| decrypt_letter(letter, rotation) }.join
  end

  def encrypt_file(filename, rotation)
    input_file = File.open(filename, 'r')
    encrypted_text = encrypt(input_file.read, rotation)

    output_file = File.open("encrypted_#{filename}", 'w')
    output_file.write(encrypted_text)
    output_file.close
  end

  def decrypt_file(filename, rotation)
    input_file = File.open(filename, 'r')
    decrypted_text = decrypt(input_file.read, rotation)

    output_filename = filename.gsub('encrypted', 'decrypted')
    output_file = File.open(output_filename, 'w')
    output_file.write(decrypted_text)
    output_file.close
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
  end
end
