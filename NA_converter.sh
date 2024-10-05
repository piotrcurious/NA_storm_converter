#!/bin/bash

# Arrays of storm names
declare -A list1 list2 list3 list4 list5 list6

list1=(
    [Alex]="Aramco" [Bonnie]="BP" [Colin]="Chevron" [Danielle]="Duke Energy" [Earl]="Exxon"
    [Fiona]="Formosa Plastics" [Gaston]="Gazprom" [Hermine]="Husky Energy" [Ian]="Indian Oil"
    [Julia]="JSW Steel" [Karl]="Koch Industries" [Lisa]="Lukoil" [Martin]="Marathon Oil"
    [Nicole]="Nippon Steel" [Owen]="Occidental" [Paula]="Petrobras" [Richard]="Repsol"
    [Shary]="Sinopec" [Tobias]="Total" [Virginie]="Vale" [Walter]="Walmart"
)

list2=(
    [Arlene]="Adani" [Bret]="BASF" [Cindy]="Cemex" [Don]="Dow" [Emily]="Eni"
    [Franklin]="Freeport-McMoRan" [Gert]="Glencore" [Harold]="Halliburton" [Idalia]="Ineos"
    [Jose]="Jingye Group" [Katia]="Kinder Morgan" [Lee]="LafargeHolcim" [Margot]="Mitsubishi"
    [Nigel]="Novatek" [Ophelia]="OMV Group" [Philippe]="Phillips 66" [Rina]="Rosneft"
    [Sean]="Shell" [Tammy]="Tata Steel" [Vince]="Valero" [Whitney]="Westlake"
)

list3=(
    [Alberto]="Anglo American" [Beryl]="Bharat Petroleum" [Chris]="ConocoPhillips" [Debby]="Dominion Energy" [Ernesto]="EnBW"
    [Francine]="Fortum" [Gordon]="General Electric" [Helene]="Heidelberg Materials" [Isaac]="Idemitsu Kosan"
    [Joyce]="JX Holdings" [Kirk]="Koc Holding" [Leslie]="Linde" [Milton]="Marubeni"
    [Nadine]="Nutrien" [Oscar]="OCI" [Patty]="PetroChina" [Rafael]="RWE"
    [Sara]="Sasol" [Tony]="ThyssenKrupp" [Valerie]="Uniper" [William]="Vistra Energy"
)

list4=(
    [Andrea]="ArcelorMittal" [Barry]="Bayer" [Chantal]="Cenovus Energy" [Dorian]="Devon Energy" [Erin]="Equinor"
    [Fernand]="Fluor" [Gabrielle]="Galp Energia" [Humberto]="Hanwha" [Imelda]="Imperial Oil"
    [Jerry]="Jacobs Engineering" [Karen]="Kumba Iron Ore" [Lorenzo]="LyondellBasell" [Melissa]="MOL Group"
    [Nestor]="NextEra Energy" [Olga]="Ovintiv" [Pablo]="PPG Industries" [Rebekah]="Reliance Industries"
    [Sebastien]="Suncor" [Tanya]="Toray Industries" [Van]="United Airlines" [Wendy]="Woodside Petroleum"
)

list5=(
    [Arthur]="Alcoa" [Bertha]="Berkshire Hathaway" [Cristobal]="Consol Energy" [Dolly]="Danieli" [Edouard]="Edison"
    [Fay]="Ferrexpo" [Gonzalo]="Georg Fischer" [Hanna]="Hess Corporation" [Isaias]="Itochu"
    [Josephine]="Jeera Energy" [Kyle]="KBR" [Laura]="Lundin Energy" [Marco]="Mitsui"
    [Nana]="NRG Energy" [Omar]="Peabody Energy" [Paulette]="Qantas Airways" [Rene]="Rolls-Royce"
    [Sally]="Schlumberger" [Teddy]="Teck Resources" [Vicky]="Vedanta" [Wilfred]="Worley"
)

list6=(
    [Ana]="Anadarko" [Bill]="BHP" [Claudette]="Chesapeake Energy" [Danny]="Dragon Oil" [Elsa]="Ecopetrol"
    [Fred]="Frontline" [Grace]="Gazprom Neft" [Henri]="Hellenic Petroleum" [Ida]="Indorama Ventures"
    [Julian]="Japan Petroleum" [Kate]="Kern Oil" [Larry]="Lukoil" [Mindy]="Murphy Oil"
    [Nicholas]="Noble Energy" [Odette]="Origin Energy" [Peter]="Pembina Pipeline" [Rose]="Repsol"
    [Sam]="Solvay" [Teresa]="Tatneft" [Victor]="Vermilion Energy" [Wanda]="Williams Companies"
)

# Function to convert name
convert_name() {
    local name=$1
    local year=$2
    local list_number=$((year % 6))
    [ $list_number -eq 0 ] && list_number=6

    local list_var="list${list_number}[${name}]"
    local new_name=${!list_var}

    if [ -n "$new_name" ]; then
        echo "$name converted to $new_name (List $list_number)"
    else
        echo "No conversion found for $name in List $list_number"
    fi
}

# Main script
echo "Enter a classical North Atlantic storm name (or 'q' to quit):"
while read -p "> " name; do
    [ "$name" = "q" ] && break
    echo "Enter the year of the storm:"
    read -p "> " year
    convert_name "$name" "$year"
done

echo "Thank you for using the Storm Name Converter!"
