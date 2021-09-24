function fish_greeting
    set welcome (whoami | lolcat)
    echo "Initialised fish shell 🐟, time is "(date +"%T %d/%m/%Y")
    echo Welcome, (whoami) | lolcat -p 0.3
end
