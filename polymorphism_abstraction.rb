class Shape
    def initialize (dimension, hasRadius) 
        @dimension = dimension
        @hasRadius = hasRadius
    end

    def getInformation (dimension, hasRadius, radius, sideLength, area, volume) 
        if (dimension == 2 && hasRadius == "E") # Eğer boyut sayısı 2 ve şekil yarıçapa sahipse çember şekline ait bilgiler gösterilir.
            puts "Bu Şekil Çemberdir"
            puts "Çemberin Yarıçapı: #{radius}"
            puts "Çemberin Alanı: #{area}"
        end
        if (dimension == 2 && hasRadius == "H") # Eğer boyut sayısı 2 ve şekil yarıçapa sahip değilse kare şekline ait bilgiler gösterilir.
            puts "Bu Şekil Karedir"
            puts "Karenin Kenar Uzunluğu: #{sideLength}"
            puts "Karenin Alanı: #{area}"
        end
        if (dimension == 3 && hasRadius == "E") # Eğer boyut sayısı 3 ve şekil yarıçapa sahipse küre şekline ait bilgiler gösterilir.
            puts "Bu Şekil Küredir"
            puts "Kürenin Yarıçapı: #{radius}"
            puts "Kürenin Alanı: #{area}"
            puts "Kürenin Hacmi: #{volume}"
        end    
        if (dimension == 3 && hasRadius == "H") # Eğer boyut sayısı 3 ve şekil yarıçapa sahip değilse küp şekline ait bilgiler gösterilir.
            puts "Bu Şekil Küptür"
            puts "Küpün Kenar Uzunluğu: #{sideLength}"
            puts "Küpün Alanı: #{area}"
            puts "Küpün Hacmi: #{volume}"
        end    
    end
end

class TwoDimensionalShape < Shape # TwoDimensionalShape(İki boyutlu şekil) sınıfı Shape(Şekil) sınıfından miras alıyor.
    def initialize (x, y)      
        @x = x
        @y = y
    end
end

class ThreeDimensionalShape < TwoDimensionalShape # ThreeDimensionalShape(Üç boyutlu şekil) sınıfı TwoDimensionalShape(İki boyutlu şekil) sınıfından miras alıyor.
    def initialize (z)
        @z = z
    end
end


class Square < TwoDimensionalShape # Square(Kare) sınıfı TwoDimensionalShape(İki boyutlu şekil) sınıfından miras alıyor.
    def initialize (sideLength)
        @sideLength = sideLength
    end
    def getArea(sideLength) # Karenin alanını bulan method
        sideLength*sideLength
    end
end

class Circle < TwoDimensionalShape # Circle(Çember) sınıfı TwoDimensionalShape(İki boyutlu şekil) sınıfından miras alıyor.
    def initialize (radius)
        @radius = radius
    end
    def getArea(radius) # Çemberin alanını bulan method
        Math::PI*radius*radius
    end
end

class Cube < ThreeDimensionalShape # Cube(Küp) sınıfı ThreeDimensionalShape(Üç boyutlu şekil) sınıfından miras alıyor.
    def initialize (sideLength, volumeIncrease)
        @sideLength = sideLength
        @volumeIncrease = volumeIncrease
    end
    def getArea(radius) # Küpün alanını bulan method
        radius*radius*6
    end
    def getVolumeIncrease(sideLength, volumeIncrease) # Küpün hacim arttırma ile yeni hacim değerini bulan method
        volume = sideLength*sideLength*sideLength
        volume = volume*volumeIncrease
    end
end

class Sphere < ThreeDimensionalShape # Sphere(Küre) sınıfı ThreeDimensionalShape(Üç boyutlu şekil) sınıfından miras alıyor.
    def initialize (radius, volumeIncrease)
        @radius = radius
        @volumeIncrease = volumeIncrease
    end
    def getArea(radius) # Kürenin alanını bulan method
        Math::PI*radius*radius*4
    end
    def getVolumeIncrease(radius, volumeIncrease)  # Kürenin hacim arttırma ile yeni hacim değerini bulan method
        volume = Math::PI*radius*radius*radius*4/3
        volume = volume*volumeIncrease
    end
end


class Test
    def self.main
   
        print "Karenin Kenar Uzunluğunu Giriniz: "
        kareninKenaruzunlugu = gets.to_i  
        kare = Square.new(kareninKenaruzunlugu)
        kareninAlanı = kare.getArea(kareninKenaruzunlugu)
        
        print "Çemberin Yarıçap Uzunluğunu Giriniz: "
        cemberinYaricapi = gets.to_i
        cember = Circle.new(cemberinYaricapi)
        cemberinAlani = cember.getArea(cemberinYaricapi)

        print "Küpün Kenar Uzunluğunu Giriniz: "
        kupunKenaruzunlugu = gets.to_i
        print "Küpün Arttırma Değerini Giriniz: "
        volumeIncrease = gets.to_i
        kup = Cube.new(kupunKenaruzunlugu, volumeIncrease)
        kupunAlani = kup.getArea(kupunKenaruzunlugu)
        kupunHacmi = kup.getVolumeIncrease(kupunKenaruzunlugu, volumeIncrease)

        print "Kürenin Yarıçap Uzunluğunu Giriniz: "
        kureninYaricapi = gets.to_i
        print "Kürenin Arttırma Değerini Giriniz: "
        volumeIncrease = gets.to_i
        kure = Sphere.new(kureninYaricapi, volumeIncrease)
        kureninAlani = kure.getArea(kureninYaricapi)
        kureninHacmi = kure.getVolumeIncrease(kureninYaricapi, volumeIncrease)
        

        x = 1
        while x <= 4 # Toplamda 4 şeklimiz olduğu için 4 defa kullanıcıdan bilgi alırız.
            print "Bilgi Almak İstediğiniz Şeklin Boyutunu Giriniz: "
            dimension = gets.to_i 
            print "Bilgi Almak İstediğiniz Şeklin Yarıçapı Var Mı?(varsa E, yoksa H giriniz): "  # Şeklimizin yarıçapı varsa E(Evet), yarıçapı yoksa H(Hayır) girilmesi istenmektedir. 
            hasRadius = gets.chomp
    
            sekil = Shape.new(dimension, hasRadius) 
            if (dimension == 2 && hasRadius == "E") # Eğer boyut sayısı 2 ve şekil yarıçapa sahipse çember şekline ait bilgiler gösterilir.
                sekil.getInformation(dimension, hasRadius, cemberinYaricapi, nil, cemberinAlani, nil)
            end
            if (dimension == 2 && hasRadius == "H") # Eğer boyut sayısı 2 ve şekil yarıçapa sahip değilse kare şekline ait bilgiler gösterilir.
                sekil.getInformation(dimension, hasRadius, nil, kareninKenaruzunlugu, kareninAlanı, nil)
            end
            if (dimension == 3 && hasRadius == "E") # Eğer boyut sayısı 3 ve şekil yarıçapa sahipse küre şekline ait bilgiler gösterilir.
                sekil.getInformation(dimension, hasRadius, kureninYaricapi, nil, kureninAlani, kureninHacmi)
            end
            if (dimension == 3 && hasRadius == "H") # Eğer boyut sayısı 3 ve şekil yarıçapa sahip değilse küp şekline ait bilgiler gösterilir.
                sekil.getInformation(dimension, hasRadius, nil, kupunKenaruzunlugu, kupunAlani, kupunHacmi)
            end
            x += 1
        end
    end
end

Test.main
