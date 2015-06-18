describe ::PositiveStringSupport do
  describe ::PositiveStringSupport::StringExt do

    describe "\#convert_meta_character_in_regexp" do
      it "converts meta character in string in order to use inregexp" do

        str_1a = "\(123\) \[abc\] \{def\}"
        str_2a = "2.3 * 5 + 0.5 = 12.0"
        str_3a = "\\" + " 2.3 ?" + " | " + "3.4 ?"
        str_4a = "+"
        str_5a = "2.3 * 5 +"

        str_1b = [ "\\" , "\(123" ,"\\" , "\)" , " " , "\\" , "\[" , "abc" , "\\" , "\]" , " " , "\\" , "\{" , "def" , "\\" , "\}" ].join
        str_2b = [ "2" , "\\" , "\." , "3" , " " , "\\" , "*" , " " , "5" , " " , "\\" , "\+" , " " , "0" , "\\" , "\." , "5" , " " , "\=" , " " , "12" , "\\" , "\." , "0" ].join
        str_3b = [ "\\" , "\\" , " " , "2" , "\\" , "\." , "3" , " " , "\\" , "\?" , " " , "\\" , "\|" , " " , "3" , "\\" , "\." , "4" , " " , "\\" , "\?" ].join
        str_4b = [ "\\" , "+" ].join
        str_5b = [ "2" , "\\" , "\." , "3" , " " , "\\" , "*" , " " , "5" , " " , "\\" , "\+" ].join

        ary_a = [ str_1a , str_2a , str_3a , str_4a , str_5a ]
        ary_b = [ str_1b , str_2b , str_3b , str_4b , str_5b ]

=begin
        puts ary_a
        puts ""
        puts ary_b
=end

        [ ary_a , ary_b ].transpose.each do | str_a , str_b |
          expect( str_a.convert_meta_character_in_regexp ).to eq( str_b )
        end
      end
    end

    describe "\#convert_comma_between_number_to_dot" do
      it "converts comma to dot" do
        expect( "23、45".convert_comma_between_number_to_dot ).to eq( "23・45" )
        expect( "3、528".convert_comma_between_number_to_dot ).to eq( "3・528" )
        expect( "123、45、678、9".convert_comma_between_number_to_dot ).to eq( "123・45・678・9" )
      end
    end
    
  end
  
  describe ::PositiveStringSupport::RegexpLibrary do
    regexp_ja = ::PositiveStringSupport::RegexpLibrary.regexp_for_parentheses_ja
    it "has class method \'regexp_for_parentheses_ja\'." do
      expect( regexp_ja ).to match( "東京メトロ丸ノ内線（中野坂上 - 方南町）" )
    end
  end
end