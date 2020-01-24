require_relative '../lib/caesar_cipher'
require 'dotenv'
Dotenv.load('.env')

str = "Test de Chriffrage/Dechiffrage !"
key_crypto = ENV["key1"].to_i * i + str.length * ENV["key2"].to_i
key_decrypt = 26 - (ENV["key1"].to_i * i + str.length * ENV["key2"].to_i ) % 26

describe 'the caesar_letter method' do
  it 'should work for downcase' do
    expect(caesar_letter('a', 1)).to eq('b')
  end
  
  it 'should work for upcase' do
    expect(caesar_letter('A', 1)).to eq('B')
  end

  it 'should loop' do
    expect(caesar_letter('z', 1)).to eq('a')
  end

  it 'should take long numbers' do
    expect(caesar_letter('a', 27)).to eq('b')
  end

  it 'should NOT caesar symbols' do
    expect(caesar_letter('!', 1)).to eq('!')
  end
end

describe 'the caesar_cipher method' do
  it 'should return to lowercase' do
    expect(caesar_cipher('ceci est un test',1)).to eq('dfdj ftu vo uftu')
  end

  it 'should return to lowercase with longer number' do
    expect(caesar_cipher('ceci est un test',27)).to eq('dfdj ftu vo uftu')
  end

  it 'should retain caps' do
    expect(caesar_cipher('Ceci est un Test',1)).to eq('Dfdj ftu vo Uftu')
  end

  it 'should not work for other input' do
    expect(caesar_cipher(1,1)).to eq('Entrez du texte petit moussaillon')
    expect(caesar_cipher('a','a')).to eq('Entres une clé valdie petit moussaillon')
  end
end 
