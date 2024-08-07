import random

numOfEntries = 20
# Example array of strings
iller_ve_ilceler = [
    "İstanbul/Kadıköy", "Ankara/Çankaya", "İzmir/Konak", "Bursa/Osmangazi", "Antalya/Muratpaşa",
    "Adana/Seyhan", "Konya/Meram", "Gaziantep/Şahinbey", "Mersin/Toroslar", "Kayseri/Melikgazi",
    "Eskişehir/Odunpazarı", "Samsun/Atakum", "Diyarbakır/Bağlar", "Malatya/Battalgazi", "Aydın/Efeler",
    "Denizli/Merkezefendi", "Tekirdağ/Süleymanpaşa", "Manisa/Şehzadeler", "Ordu/Altınordu", "Elazığ/Merkez"
]

# Open the file in write mode
with open("test.txt", "w", encoding="utf-8") as file:
    # Loop to select and print a random entry 5 times
    for i in range(numOfEntries):
        konum = random.choice(iller_ve_ilceler)
        file.write(f"INSERT INTO `proje`.`depo` (`DepoID`, `Konum`) VALUES ('{i + 1}', '{konum}');\n")
        
