require_relative './encryptor'
require 'test/unit'

# Encryptor test
class TestEncryptor < Test::Unit::TestCase
  def test_encrypt_or_decrypt_letter
    assert_equal('N', Encryptor.new.encrypt_letter('D', 10))
    assert_equal('D', Encryptor.new.decrypt_letter('N', 10))
  end

  def test_encrypt_or_decrypt_word
    word_to_encrypt = 'Hello, World!'
    encrypted_word = 'Rovvy6*ay!vn+'

    assert_equal(encrypted_word, Encryptor.new.encrypt(word_to_encrypt, 10))
    assert_equal(word_to_encrypt, Encryptor.new.decrypt(encrypted_word, 10))
  end
end
