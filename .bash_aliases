
#Open Battleshribe rooster editor
alias battleshribe='/lib/Battleshribe/RosterEditor.sh'

#Go to folder for IDATG2001
alias prog='cd /home/sivert/Skoledokumenter/T2-2021/IDATG2001'

#cd to folder for IDATG1002
alias sysut='cd /home/sivert/Skoledokumenter/T2-2021/IDATG1002'

#open Firefox on second profile
alias firefox2='nohup firefox -p default-release --no-remote &'


#clear screen and set colors for neofetch
alias neofetch='clear && neofetch --ascii ~/.config/neofetch/colored_pop.txt --ascii_colors 7 15'

#Run radio script
alias radio='$HOME/bin/radio.sh'

#Add autocompletion for radio
complete -W "--lain --darksynth --thanatos --lofi --va11hall-a --50s -la -d -t -lo -v -5" radio
