import random

numOfEntries = 200
# Example array of strings


# Open the file in write mode
with open("test.txt", "w", encoding="utf-8") as file:
    # Loop to select and print a random entry 5 times
    for i in range(100):

        tedarikçiID1 = random.randint(1, 25)
        fiyat1       = random_float = random.uniform(200, 5000)

        tedarikçiID2 = random.randint(26, 50)
        fiyat2       = random_float = random.uniform(200, 5000)
        
        tedarikçiID3 = random.randint(51, 75)
        fiyat3       = random_float = random.uniform(200, 5000)
        
        tedarikçiID4 = random.randint(76, 100)
        fiyat4       = random_float = random.uniform(200, 5000)

        file.write(f"INSERT INTO `proje`.`fiyat_verir` (`SiparişID`, `TedarikçiID`, `Fiyat`) VALUES ('{i + 1}', '{tedarikçiID1}', '{fiyat1}');\n")
        file.write(f"INSERT INTO `proje`.`fiyat_verir` (`SiparişID`, `TedarikçiID`, `Fiyat`) VALUES ('{i + 1}', '{tedarikçiID2}', '{fiyat2}');\n")
        file.write(f"INSERT INTO `proje`.`fiyat_verir` (`SiparişID`, `TedarikçiID`, `Fiyat`) VALUES ('{i + 1}', '{tedarikçiID3}', '{fiyat3}');\n")
        file.write(f"INSERT INTO `proje`.`fiyat_verir` (`SiparişID`, `TedarikçiID`, `Fiyat`) VALUES ('{i + 1}', '{tedarikçiID4}', '{fiyat4}');\n")
        
