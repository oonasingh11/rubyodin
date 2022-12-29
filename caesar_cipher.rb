def caesar_cipher(text, shiftvalue)
  caesartext = ""
  text.each_char do |a|
    if a.match(/[a-zA-Z]/)
      shiftvalue %= 26
      if a.match(/[A-Z]/)
        caesartext += ((a.ord - 65 + shiftvalue) % 26 + 65).chr
      else
        caesartext += ((a.ord - 97 + shiftvalue) % 26 + 97).chr
      end
    else
      caesartext += a
    end
  end
  caesartext
end
