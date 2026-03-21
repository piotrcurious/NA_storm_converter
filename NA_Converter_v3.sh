
#!/bin/bash

# Arrays of storm names with CO2 emissions data for high-emitting corporations
declare -A list1 list2 list3 list4 list5 list6 supplemental_list

# Function to populate lists
populate_lists() {
    list1=(
        [Alex]="Aramco:552" [Bonnie]="BP:448" [Colin]="Chevron:696" [Danielle]="Duke Energy:107" [Earl]="ExxonMobil:571"
        [Fiona]="Formosa Plastics:59" [Gaston]="Gazprom:587" [Hermine]="Husky Energy:22" [Ian]="Indian Oil:49" [Julia]="Jera:46"
        [Karl]="Kinder Morgan:38" [Lisa]="Lukoil:201" [Martin]="Marathon Petroleum:87" [Nicole]="National Iranian Oil:513" [Owen]="OMV:25"
        [Paula]="PetroChina:407" [Richard]="Repsol:170" [Shary]="Shell:448" [Tobias]="TotalEnergies:381" [Virginie]="Valero Energy:67" [Walter]="WEC Energy Group:32"
    )

    list2=(
        [Arlene]="ArcelorMittal:275" [Bret]="BHP:314" [Cindy]="ConocoPhillips:217" [Don]="Dow Chemical:88" [Emily]="Enel:92"
        [Franklin]="Formosa Petrochemical:62" [Gert]="Glencore:313" [Harold]="Hess Corporation:12" [Idalia]="Inter Pipeline:8" [Jose]="JX Nippon:53"
        [Katia]="Kansai Electric Power:53" [Lee]="Linde:37" [Margot]="Mitsubishi:63" [Nigel]="NextEra Energy:52" [Ophelia]="Occidental Petroleum:51"
        [Philippe]="Phillips 66:83" [Rina]="Reliance Industries:91" [Sean]="Sasol:67" [Tammy]="Tatneft:80" [Vince]="Vistra:106" [Whitney]="Williams Companies:22"
    )

    list3=(
        [Alberto]="Air Products:33" [Beryl]="BASF:85" [Chris]="Cemex:120" [Debby]="Devon Energy:22" [Ernesto]="Enbridge:63"
        [Francine]="FirstEnergy:40" [Gordon]="GE:22" [Helene]="Halliburton:24" [Isaac]="Imperial Oil:42" [Joyce]="Johnson Matthey:3"
        [Kirk]="Kiewit:4" [Leslie]="LyondellBasell:43" [Milton]="Mitsubishi Materials:11" [Nadine]="Nippon Steel:257" [Oscar]="OCI:9"
        [Patty]="PKN Orlen:37" [Rafael]="Repsol:170" [Sara]="Sumitomo Chemical:18" [Tony]="ThyssenKrupp:112" [Valerie]="Vale:107" [William]="Weyerhaeuser:8"
    )

    list4=(
        [Andrea]="Air Liquide:33" [Barry]="Bayer:24" [Chantal]="CRH:115" [Dorian]="Danone:16" [Erin]="Eastman Chemical:17"
        [Fernand]="Fluor:1" [Gabrielle]="General Electric:22" [Humberto]="HeidelbergCement:122" [Imelda]="International Paper:23" [Jerry]="Johnson Controls:8"
        [Karen]="Koch Industries:75" [Lorenzo]="LafargeHolcim:561" [Melissa]="Mitsubishi Heavy Industries:25" [Nestor]="Nestlé:113" [Olga]="Owens Corning:5"
        [Pablo]="Procter & Gamble:11" [Rebekah]="Rio Tinto:31" [Sebastien]="Saint-Gobain:25" [Tanya]="Toray Industries:15" [Van]="Veolia:27" [Wendy]="Waste Management:16"
    )

    list5=(
        [Arthur]="AES Corporation:62" [Bertha]="Berkshire Hathaway Energy:76" [Cristobal]="CLP Group:49" [Dolly]="Dominion Energy:40" [Edouard]="E.ON:63"
        [Fay]="Fortum:24" [Gonzalo]="Guangdong Energy Group:47" [Hanna]="Huaneng Power:248" [Isaias]="Iberdrola:66" [Josephine]="J-Power:63"
        [Kyle]="Kyushu Electric Power:49" [Laura]="Los Angeles Department of Water and Power:12" [Marco]="Minnesota Power:13" [Nana]="NRG Energy:49" [Omar]="Origin Energy:18"
        [Paulette]="PG&E:15" [Rene]="RWE:162" [Sally]="Southern Company:97" [Teddy]="Tennessee Valley Authority:52" [Vicky]="Vattenfall:21" [Wilfred]="Wisconsin Energy Corporation:28"
    )

    list6=(
        [Ana]="Anhui Conch:103" [Bill]="Baowu:290" [Claudette]="China National Building Material:386" [Danny]="Dangote Cement:91" [Elsa]="Eurocement:54"
        [Fred]="Fiat Chrysler:95" [Grace]="General Motors:84" [Henri]="Honda:95" [Ida]="Israel Chemicals:3" [Julian]="JSW Steel:108"
        [Kate]="Kia:47" [Larry]="Lafarge:561" [Mindy]="Mazda:41" [Nicholas]="Nissan:79" [Odette]="OJSC Novolipetsk Steel:95"
        [Peter]="POSCO:207" [Rose]="Renault:57" [Sam]="SAIC Motor:58" [Teresa]="Tata Steel:159" [Victor]="Volkswagen:118" [Wanda]="Woolworths Group:2"
    )

    supplemental_list=(
        [Adria]="Alcoa:71" [Braylen]="Bunge:6" [Caridad]="Cargill:12" [Deshawn]="Dalmia Cement:36" 
        [Emery]="Emirates Steel:7" [Foster]="Ferrexpo:7" [Gemma]="Gerdau:89" [Heath]="Holcim:561" [Isla]="INEOS:40" 
        [Jacobus]="JBS:5" [Kenzie]="Kobelco:19" [Lucio]="Louis Dreyfus:1" [Makayla]="Mohawk Industries:3" 
        [Nolan]="Norsk Hydro:24" [Orlanda]="Outokumpu:7" [Pax]="PepsiCo:18" [Ronin]="Resolute Forest Products:3" 
        [Sophie]="Sappi:10" [Tayshaun]="Teck Resources:70" [Viviana]="Voestalpine:69" [Will]="Wilmar International:4"
    )
}

# Function to convert name
convert_name() {
    local name=$1
    local found=false

    for list_num in {1..6}; do
        list_var="list${list_num}[${name}]"
        if [ -n "${!list_var}" ]; then
            found=true
            break
        fi
    done

    if [ "$found" = false ]; then
        list_var="supplemental_list[${name}]"
        if [ -n "${!list_var}" ]; then
            found=true
            list_num="Supplemental"
        fi
    fi

    if [ "$found" = true ]; then
        IFS=':' read -r new_name emissions <<< "${!list_var}"
        if [ "$emissions" = "N/A" ]; then
            echo "$name converted to $new_name (List $list_num)"
            echo "CO2 emissions data not available for this corporation"
        else
            echo "$name converted to $new_name (List $list_num)"
            echo "Annual CO2 emissions: $emissions million metric tons"
        fi
    else
        echo "No conversion found for $name in any list"
    fi
}

# Function to find storm by year and number
find_storm_by_year_and_number() {
    local year=$1
    local storm_number=$2
    local list_number=$((year % 6))
    [ $list_number -eq 0 ] && list_number=6

    local list_var="list${list_number}[@]"
    local storm_names=(${!list_var})

    if [ $storm_number -le ${#storm_names[@]} ]; then
        local name=${storm_names[$((storm_number - 1))]}
        convert_name "$name"
    elif [ $storm_number -le $((${#storm_names[@]} + ${#supplemental_list[@]})) ]; then
        local supplemental_names=(${!supplemental_list[@]})
        local name=${supplemental_names[$((storm_number - ${#storm_names[@]} - 1))]}
        convert_name "$name"
    else
        echo "No storm found for year $year and number $storm_number"
    fi
}

# Main script
echo "Enter 'name' to search by storm name, or 'year' to search by year and storm number (or 'q' to quit):"
while read -p "> " search_type; do
    case $search_type in
        q)
            break
            ;;
        name)
            echo "Enter a classical North Atlantic storm name:"
            read -p "> " name
            convert_name "$name"
            ;;
        year)
            echo "Enter the year of the storm:"
            read -p "> " year
            echo "Enter the storm number:"
            read -p "> " storm_number
            find_storm_by_year_and_number "$year" "$storm_number"
            ;;
        *)
            echo "Invalid input. Please enter 'name', 'year', or 'q'."
            ;;
    esac
    echo "----------------------------------------"
    echo "Enter 'name', 'year', or 'q' to quit:"
done

echo "Thank you for using the Enhanced Storm Name Converter with Supplemental List!"
