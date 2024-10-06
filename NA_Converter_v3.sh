#!/bin/bash

# Arrays of storm names with CO2 emissions data
declare -A list1 list2 list3 list4 list5 list6 supplemental_list

list1=(
    [Alex]="Aramco:59.26" [Bonnie]="BP:41.31" [Colin]="Chevron:69.64" [Danielle]="Duke Energy:87.0" [Earl]="Exxon:112.0"
    [Fiona]="Formosa Plastics:59.3" [Gaston]="Gazprom:96.0" [Hermine]="Husky Energy:11.0" [Ian]="Indian Oil:21.5"
    [Julia]="JSW Steel:24.7" [Karl]="Koch Industries:24.0" [Lisa]="Lukoil:83.0" [Martin]="Marathon Oil:6.9"
    [Nicole]="Nippon Steel:70.0" [Owen]="Occidental:28.4" [Paula]="Petrobras:77.0" [Richard]="Repsol:189.0"
    [Shary]="Sinopec:170.6" [Tobias]="Total:41.5" [Virginie]="Vale:11.3" [Walter]="Walmart:17.56"
)

list2=(
    [Arlene]="Adani:60.0" [Bret]="BASF:20.0" [Cindy]="Cemex:39.0" [Don]="Dow:35.0" [Emily]="Eni:62.0"
    [Franklin]="Freeport-McMoRan:9.0" [Gert]="Glencore:26.0" [Harold]="Halliburton:5.9" [Idalia]="Ineos:18.5"
    [Jose]="Jingye Group:N/A" [Katia]="Kinder Morgan:50.0" [Lee]="LafargeHolcim:121.0" [Margot]="Mitsubishi:9.4"
    [Nigel]="Novatek:9.9" [Ophelia]="OMV Group:12.6" [Philippe]="Phillips 66:50.0" [Rina]="Rosneft:81.0"
    [Sean]="Shell:95.0" [Tammy]="Tata Steel:29.8" [Vince]="Valero:29.0" [Whitney]="Westlake:10.9"
)

list3=(
    [Alberto]="Anglo American:16.1" [Beryl]="Bharat Petroleum:8.5" [Chris]="ConocoPhillips:49.4" [Debby]="Dominion Energy:40.0" [Ernesto]="EnBW:16.4"
    [Francine]="Fortum:17.5" [Gordon]="General Electric:2.3" [Helene]="Heidelberg Materials:76.7" [Isaac]="Idemitsu Kosan:12.7"
    [Joyce]="JX Holdings:N/A" [Kirk]="Koc Holding:N/A" [Leslie]="Linde:37.2" [Milton]="Marubeni:1.6"
    [Nadine]="Nutrien:13.0" [Oscar]="OCI:5.1" [Patty]="PetroChina:170.0" [Rafael]="RWE:89.0"
    [Sara]="Sasol:67.0" [Tony]="ThyssenKrupp:22.0" [Valerie]="Uniper:49.4" [William]="Vistra Energy:106.0"
)

list4=(
    [Andrea]="ArcelorMittal:158.0" [Barry]="Bayer:3.76" [Chantal]="Cenovus Energy:23.9" [Dorian]="Devon Energy:4.9" [Erin]="Equinor:15.0"
    [Fernand]="Fluor:0.5" [Gabrielle]="Galp Energia:3.2" [Humberto]="Hanwha:N/A" [Imelda]="Imperial Oil:10.0"
    [Jerry]="Jacobs Engineering:0.14" [Karen]="Kumba Iron Ore:0.9" [Lorenzo]="LyondellBasell:16.6" [Melissa]="MOL Group:6.8"
    [Nestor]="NextEra Energy:51.7" [Olga]="Ovintiv:6.5" [Pablo]="PPG Industries:3.5" [Rebekah]="Reliance Industries:58.0"
    [Sebastien]="Suncor:20.3" [Tanya]="Toray Industries:5.6" [Van]="United Airlines:34.5" [Wendy]="Woodside Petroleum:9.2"
)

list5=(
    [Arthur]="Alcoa:23.9" [Bertha]="Berkshire Hathaway:131.0" [Cristobal]="Consol Energy:19.0" [Dolly]="Danieli:N/A" [Edouard]="Edison:10.0"
    [Fay]="Ferrexpo:1.1" [Gonzalo]="Georg Fischer:0.7" [Hanna]="Hess Corporation:5.5" [Isaias]="Itochu:3.2"
    [Josephine]="Jeera Energy:N/A" [Kyle]="KBR:0.03" [Laura]="Lundin Energy:0.2" [Marco]="Mitsui:0.8"
    [Nana]="NRG Energy:49.0" [Omar]="Peabody Energy:92.0" [Paulette]="Qantas Airways:12.4" [Rene]="Rolls-Royce:0.4"
    [Sally]="Schlumberger:5.8" [Teddy]="Teck Resources:3.0" [Vicky]="Vedanta:58.7" [Wilfred]="Worley:0.2"
)

list6=(
    [Ana]="Anadarko:13.0" [Bill]="BHP:15.8" [Claudette]="Chesapeake Energy:5.7" [Danny]="Dragon Oil:N/A" [Elsa]="Ecopetrol:11.8"
    [Fred]="Frontline:7.4" [Grace]="Gazprom Neft:96.1" [Henri]="Hellenic Petroleum:3.8" [Ida]="Indorama Ventures:14.7"
    [Julian]="Japan Petroleum:N/A" [Kate]="Kern Oil:N/A" [Larry]="Lukoil:83.0" [Mindy]="Murphy Oil:2.1"
    [Nicholas]="Noble Energy:4.3" [Odette]="Origin Energy:19.8" [Peter]="Pembina Pipeline:3.6" [Rose]="Repsol:189.0"
    [Sam]="Solvay:10.0" [Teresa]="Tatneft:28.8" [Victor]="Vermilion Energy:2.1" [Wanda]="Williams Companies:9.5"
)

# Supplemental list
supplemental_list=(
    [Adria]="Air Products:12.7" [Braylen]="Baowu Steel:158.3" [Caridad]="Continental Resources:5.3" 
    [Deshawn]="Dominion Resources:40.0" [Emery]="Enel:97.9" [Foster]="Flint Hills Resources:18.0" 
    [Gemma]="Gerdau:15.1" [Heath]="Holcim:114.6" [Isla]="Iberdrola:24.6" [Jacobus]="Johnson & Johnson:5.0" 
    [Kenzie]="Korea Electric Power:173.6" [Lucio]="Lenovo:1.5" [Makayla]="Magna International:1.7" 
    [Nolan]="Newmont Mining:3.3" [Orlanda]="Oxy:58.1" [Pax]="Petrobras:73.0" [Ronin]="Rio Tinto:31.5" 
    [Sophie]="Sumitomo:4.4" [Tayshaun]="Toyota:18.1" [Viviana]="Volkswagen:118.0" [Will]="West Fraser:3.1"
)

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
