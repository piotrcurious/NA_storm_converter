import sys
import argparse

class StormTranscoder:
    def __init__(self):
        # Rotating WMO lists for North Atlantic
        # Logic: (year - 2021) % 6
        # 0: 2021 / 2027 list
        # 1: 2022 / 2028 list
        # 2: 2023 / 2029 list
        # 3: 2024 / 2030 list
        # 4: 2025 / 2031 list
        # 5: 2026 / 2032 list

        self.lists = {
            0: { # 2021 / 2027
                "Ana": ("Anhui Conch", 103),
                "Bill": ("Baowu", 290),
                "Claudette": ("China National Building Material", 386),
                "Danny": ("Dangote Cement", 91),
                "Elsa": ("Eurocement", 54),
                "Fred": ("Fiat Chrysler", 95),
                "Grace": ("General Motors", 84),
                "Henri": ("Honda", 95),
                "Imani": ("Israel Chemicals", 3), # Replaced Ida (2021 retired)
                "Julian": ("JSW Steel", 108),
                "Kate": ("Kia", 47),
                "Larry": ("Lafarge", 561),
                "Mindy": ("Mazda", 41),
                "Nicholas": ("Nissan", 79),
                "Odette": ("OJSC Novolipetsk Steel", 95),
                "Peter": ("POSCO", 207),
                "Rose": ("Renault", 57),
                "Sam": ("SAIC Motor", 58),
                "Teresa": ("Tata Steel", 159),
                "Victor": ("Volkswagen", 118),
                "Wanda": ("Woolworths Group", 2)
            },
            1: { # 2022 / 2028
                "Alex": ("Aramco", 552),
                "Bonnie": ("BP", 448),
                "Colin": ("Chevron", 696),
                "Danielle": ("Duke Energy", 107),
                "Earl": ("ExxonMobil", 571),
                "Farrah": ("Formosa Plastics", 59), # Replaced Fiona (2022 retired)
                "Gaston": ("Gazprom", 587),
                "Hermine": ("Husky Energy", 22),
                "Idris": ("Indian Oil", 49), # Replaced Ian (2022 retired)
                "Julia": ("Jera", 46),
                "Karl": ("Kinder Morgan", 38),
                "Lisa": ("Lukoil", 201),
                "Martin": ("Marathon Petroleum", 87),
                "Nicole": ("National Iranian Oil", 513),
                "Owen": ("OMV", 25),
                "Paula": ("PetroChina", 407),
                "Richard": ("Repsol", 170),
                "Shary": ("Shell", 448),
                "Tobias": ("TotalEnergies", 381),
                "Virginie": ("Valero Energy", 67),
                "Walter": ("WEC Energy Group", 32)
            },
            2: { # 2023 / 2029
                "Arlene": ("Adani", 60),
                "Bret": ("BASF", 20),
                "Cindy": ("Cemex", 39),
                "Don": ("Dow", 35),
                "Emily": ("Eni", 62),
                "Franklin": ("Freeport-McMoRan", 9),
                "Gert": ("Glencore", 26),
                "Harold": ("Halliburton", 5.9),
                "Idalia": ("Ineos", 18.5),
                "Jose": ("Jingye Group", None),
                "Katia": ("Kinder Morgan", 50),
                "Lee": ("LafargeHolcim", 121),
                "Margot": ("Mitsubishi", 9.4),
                "Nigel": ("Novatek", 9.9),
                "Ophelia": ("OMV Group", 12.6),
                "Philippe": ("Phillips 66", 50),
                "Rina": ("Rosneft", 81),
                "Sean": ("Shell", 95),
                "Tammy": ("Tata Steel", 29.8),
                "Vince": ("Valero", 29),
                "Whitney": ("Westlake", 10.9)
            },
            3: { # 2024 / 2030
                "Alberto": ("Air Products", 33),
                "Beryl": ("BASF", 85),
                "Chris": ("Cemex", 120),
                "Debby": ("Devon Energy", 22),
                "Ernesto": ("Enbridge", 63),
                "Francine": ("FirstEnergy", 40),
                "Gordon": ("GE", 22),
                "Helene": ("Halliburton", 24),
                "Isaac": ("Imperial Oil", 42),
                "Joyce": ("Johnson Matthey", 3),
                "Kirk": ("Kiewit", 4),
                "Leslie": ("LyondellBasell", 43),
                "Milton": ("Mitsubishi Materials", 11),
                "Nadine": ("Nippon Steel", 257),
                "Oscar": ("OCI", 9),
                "Patty": ("PKN Orlen", 37),
                "Rafael": ("Repsol", 170),
                "Sara": ("Sumitomo Chemical", 18),
                "Tony": ("ThyssenKrupp", 112),
                "Valerie": ("Vale", 107),
                "William": ("Weyerhaeuser", 8)
            },
            4: { # 2025 / 2031
                "Andrea": ("Air Liquide", 33),
                "Barry": ("Bayer", 24),
                "Chantal": ("CRH", 115),
                "Dexter": ("Danone", 16), # Replaced Dorian (2019 retired)
                "Erin": ("Eastman Chemical", 17),
                "Fernand": ("Fluor", 1),
                "Gabrielle": ("General Electric", 22),
                "Humberto": ("HeidelbergCement", 122),
                "Imelda": ("International Paper", 23),
                "Jerry": ("Johnson Controls", 8),
                "Karen": ("Koch Industries", 75),
                "Lorenzo": ("LafargeHolcim", 561),
                "Melissa": ("Mitsubishi Heavy Industries", 25),
                "Nestor": ("Nestlé", 113),
                "Olga": ("Owens Corning", 5),
                "Pablo": ("Procter & Gamble", 11),
                "Rebekah": ("Rio Tinto", 31),
                "Sebastien": ("Saint-Gobain", 25),
                "Tanya": ("Toray Industries", 15),
                "Van": ("Veolia", 27),
                "Wendy": ("Waste Management", 16)
            },
            5: { # 2026 / 2032
                "Arthur": ("AES Corporation", 62),
                "Bertha": ("Berkshire Hathaway Energy", 76),
                "Cristobal": ("CLP Group", 49),
                "Dolly": ("Dominion Energy", 40),
                "Edouard": ("E.ON", 63),
                "Fay": ("Fortum", 24),
                "Gonzalo": ("Guangdong Energy Group", 47),
                "Hanna": ("Huaneng Power", 248),
                "Isaias": ("Iberdrola", 66),
                "Josephine": ("J-Power", 63),
                "Kyle": ("Kyushu Electric Power", 49),
                "Leah": ("LADWP", 12), # Replaced Laura (2020 retired)
                "Marco": ("Minnesota Power", 13),
                "Nana": ("NRG Energy", 49),
                "Omar": ("Origin Energy", 18),
                "Paulette": ("PG&E", 15),
                "Rene": ("RWE", 162),
                "Sally": ("Southern Company", 97),
                "Teddy": ("Tennessee Valley Authority", 52),
                "Vicky": ("Vattenfall", 21),
                "Wilfred": ("Wisconsin Energy Corporation", 28)
            }
        }

        self.supplemental = {
            "Adria": ("Alcoa", 71),
            "Braylen": ("Bunge", 6),
            "Caridad": ("Cargill", 12),
            "Deshawn": ("Dalmia Cement", 36),
            "Emery": ("Emirates Steel", 7),
            "Foster": ("Ferrexpo", 7),
            "Gemma": ("Gerdau", 89),
            "Heath": ("Holcim", 561),
            "Isla": ("INEOS", 40),
            "Jacobus": ("JBS", 5),
            "Kenzie": ("Kobelco", 19),
            "Lucio": ("Louis Dreyfus", 1),
            "Makayla": ("Mohawk Industries", 3),
            "Nolan": ("Norsk Hydro", 24),
            "Orlanda": ("Outokumpu", 7),
            "Pax": ("PepsiCo", 18),
            "Ronin": ("Resolute Forest Products", 3),
            "Sophie": ("Sappi", 10),
            "Tayshaun": ("Teck Resources", 70),
            "Viviana": ("Voestalpine", 69),
            "Will": ("Wilmar International", 4)
        }

    def get_list_for_year(self, year):
        return self.lists[(year - 2021) % 6]

    def convert_by_name(self, name):
        name = name.capitalize()
        found = []
        # Check in all lists
        for list_idx, storm_list in self.lists.items():
            if name in storm_list:
                base_year = 2021 + list_idx
                corp, emissions = storm_list[name]
                found.append({
                    "type": f"List {list_idx} (e.g. {base_year} rotation)",
                    "corporation": corp,
                    "emissions": emissions
                })

        if name in self.supplemental:
            corp, emissions = self.supplemental[name]
            found.append({
                "type": "Supplemental List",
                "corporation": corp,
                "emissions": emissions
            })

        return found

    def convert_by_year_and_number(self, year, number):
        storm_list = self.get_list_for_year(year)
        # Convert dict to sorted list of names (assuming the order in the dict is alphabetical or chronological)
        # Actually, WMO lists are alphabetical.
        sorted_names = sorted(storm_list.keys())

        if 1 <= number <= len(sorted_names):
            name = sorted_names[number - 1]
            corp, emissions = storm_list[name]
            return {
                "name": name,
                "corporation": corp,
                "emissions": emissions,
                "list": f"Year {year} Rotation"
            }
        elif len(sorted_names) < number <= len(sorted_names) + len(self.supplemental):
            supp_names = sorted(self.supplemental.keys())
            name = supp_names[number - len(sorted_names) - 1]
            corp, emissions = self.supplemental[name]
            return {
                "name": name,
                "corporation": corp,
                "emissions": emissions,
                "list": "Supplemental"
            }
        else:
            return None

def main():
    transcoder = StormTranscoder()

    print("=== North Atlantic Storm Transcoder (Future Proofed 2024-2029) ===")
    print("Welcome to the 2026-2027 ready storm naming system.")

    while True:
        print("\nOptions:")
        print("1. Search by Storm Name")
        print("2. Search by Year and Storm Number")
        print("3. Quit")

        choice = input("\nSelect an option: ")

        if choice == '1':
            name = input("Enter storm name: ").strip()
            results = transcoder.convert_by_name(name)
            if not results:
                print(f"No conversion found for '{name}'.")
            else:
                for res in results:
                    print(f"\nFound in {res['type']}:")
                    print(f"  Corporate Name: {res['corporation']}")
                    em = res['emissions']
                    print(f"  CO2 Emissions: {em if em else 'N/A'} million metric tons")

        elif choice == '2':
            try:
                year = int(input("Enter year (e.g., 2026): "))
                number = int(input("Enter storm number (1-42): "))
                res = transcoder.convert_by_year_and_number(year, number)
                if res:
                    print(f"\nStorm #{number} in {year} is {res['name']}.")
                    print(f"  Converted to: {res['corporation']}")
                    print(f"  CO2 Emissions: {res['emissions'] if res['emissions'] else 'N/A'} million metric tons")
                    print(f"  Source: {res['list']}")
                else:
                    print(f"No storm found for year {year} and number {number}.")
            except ValueError:
                print("Invalid input. Please enter numbers for year and storm number.")

        elif choice == '3' or choice.lower() == 'q':
            print("Thank you for using the Storm Transcoder. Goodbye!")
            break
        else:
            print("Invalid option. Please try again.")

if __name__ == "__main__":
    main()
