#!/bin/bash

# Arrays of storm names with CO2 emissions data for high-emitting corporations
declare -A list1 list2 list3 list4 list5 list6 supplemental_list

# Function to populate lists
populate_lists() {
    list1=(
        [Arlene]="Aramco:552" [Bret]="BP:448" [Cindy]="Chevron:696" [Don]="Duke Energy:107" [Emily]="ExxonMobil:571"
        [Franklin]="Formosa Plastics:59" [Gert]="Gazprom:587" [Harold]="Husky Energy:22" [Idalia]="Indian Oil:49" [Jose]="Jera:46"
        [Katia]="Kinder Morgan:38" [Lee]="Lukoil:201" [Margot]="Marathon Petroleum:87" [Nigel]="National Iranian Oil:513" [Ophelia]="OMV:25"
        [Philippe]="PetroChina:407" [Rina]="Repsol:170" [Sean]="Shell:448" [Tammy]="TotalEnergies:381" [Vince]="Valero Energy:67" [Whitney]="WEC Energy Group:32"
    )

    list2=(
        [Alex]="ArcelorMittal:275" [Bonnie]="BHP:314" [Colin]="ConocoPhillips:217" [Danielle]="Dow Chemical:88" [Earl]="Enel:92"
        [Fiona]="Formosa Petrochemical:62" [Gaston]="Glencore:313" [Hermine]="Hess Corporation:12" [Ian]="Inter Pipeline:8" [Julia]="JX Nippon:53"
        [Karl]="Kansai Electric Power:53" [Lisa]="Linde:37" [Martin]="Mitsubishi:63" [Nicole]="NextEra Energy:52"
        [Owen]="Occidental Petroleum:51" [Paula]="Phillips 66:83" [Richard]="Reliance Industries:91" [Shary]="Sasol:67"
        [Tobias]="Tatneft:80" [Virginie]="Vistra:106" [Walter]="Williams Companies:22"
    )

    list3=(
        [Andrea]="Air Products:33" [Barry]="BASF:85" [Chantal]="Cemex:120" [Dorian]="Devon Energy:22" [Erin]="Enbridge:63"
        [Fernand]="FirstEnergy:40" [Gabrielle]="GE:22" [Humberto]="Halliburton:24" [Imelda]="Imperial Oil:42"
        [Jerry]="Johnson Matthey:3" [Karen]="Kiewit:4" [Lorenzo]="LyondellBasell:43" [Melissa]="Mitsubishi Materials:11"
        [Nestor]="Nippon Steel:257" [Olga]="OCI:9" [Pablo]="PKN Orlen:37" [Rebekah]="Repsol:170"
        [Sebastian]="Sumitomo Chemical:18" [Tanya]="ThyssenKrupp:112" [Van]="Vale:107" [Wendy]="Weyerhaeuser:8"
    )

    list4=(
        [Alberto]="Air Liquide:33" [Beryl]="Bayer:24" [Chris]="CRH:115" [Debby]="Danone:16" [Ernesto]="Eastman Chemical:17"
        [Francine]="Fluor:1" [Gordon]="General Electric:22" [Helene]="HeidelbergCement:122" [Isaac]="International Paper:23"
        [Joyce]="Johnson Controls:8" [Kirk]="Koch Industries:75" [Leslie]="LafargeHolcim:561" [Milton]="Mitsubishi Heavy Industries:25"
        [Nadine]="Nestlé:113" [Oscar]="Owens Corning:5" [Patty]="Procter & Gamble:11" [Rafael]="Rio Tinto:31"
        [Sara]="Saint-Gobain:25" [Tony]="Toray Industries:15" [Valerie]="Veolia:27" [William]="Waste Management:16"
    )

    list5=(
        [Ana]="AES Corporation:62" [Bill]="Berkshire Hathaway Energy:76" [Claudette]="CLP Group:49" [Danny]="Dominion Energy:40" [Elsa]="E.ON:63"
        [Fred]="Fortum:24" [Grace]="Guangdong Energy Group:47" [Henri]="Huaneng Power:248" [Ida]="Iberdrola:66"
        [Julian]="J-Power:63" [Kate]="Kyushu Electric Power:49" [Larry]="Los Angeles Department of Water and Power:12" [Mindy]="Minnesota Power:13"
        [Nicholas]="NRG Energy:49" [Odette]="Origin Energy:18" [Peter]="PG&E:15" [Rose]="RWE:162"
        [Sam]="Southern Company:97" [Teresa]="Tennessee Valley Authority:52" [Victor]="Vattenfall:21" [Wanda]="Wisconsin Energy Corporation:28"
    )

    list6=(
        [Arthur]="Anhui Conch:103" [Bonnie]="Baowu:290" [Cindy]="China National Building Material:386" [Don]="Dangote Cement:91" [Emily]="Eurocement:54"
        [Franklin]="Fiat Chrysler:95" [Gert]="General Motors:84" [Harold]="Honda:95" [Idalia]="Israel Chemicals:3" [Jose]="JSW Steel:108"
        [Katia]="Kia:47" [Lee]="Lafarge:561" [Margot]="Mazda:41" [Nigel]="Nissan:79" [Ophelia]="OJSC Novolipetsk Steel:95"
        [Philippe]="POSCO:207" [Rina]="Renault:57" [Sean]="SAIC Motor:58" [Tammy]="Tata Steel:159" [Vince]="Volkswagen:118" [Whitney]="Woolworths Group:2"
    )

    supplemental_list=(
        [Adria]="Alcoa:71" [Braylen]="Bunge:6" [Caridad]="Cargill:12" [Deshawn]="Dalmia Cement:36" 
        [Emery]="Emirates Steel:7" [Foster]="Ferrexpo:7" [Gemma]="Gerdau:89" [Heath]="Holcim:561" [Isla]="INEOS:40" 
        [Jacobus]="JBS:5" [Kenzie]="Kobelco:19" [Lucio]="Louis Dreyfus:1" [Makayla]="Mohawk Industries:3" 
        [Nolan]="Norsk Hydro:24" [Orlanda]="Outokumpu:7" [Pax]="PepsiCo:18" [Ronin]="Resolute Forest Products:3" 
        [Sophie]="Sappi:10" [Tayshaun]="Teck Resources:70" [Viviana]="Voestalpine:69" [Will]="Wilmar International:4"
    )
}

# ... (rest of the code remains the same)
