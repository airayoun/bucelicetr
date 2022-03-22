#macos-run.sh MAC_USER_PASSWORD VNC_PASSWORD NGROK_AUTH_TOKEN MAC_REALNAME

#disable spotlight indexing
sudo mdutil -i off -a

#Create new account
sudo dscl . -create /Users/bucelicetr
sudo dscl . -create /Users/bucelicetr UserShell /bin/bash
sudo dscl . -create /Users/bucelicetr RealName $4
sudo dscl . -create /Users/bucelicetr UniqueID 1001
sudo dscl . -create /Users/bucelicetr PrimaryGroupID 80
sudo dscl . -create /Users/bucelicetr NFSHomeDirectory /Users/bucelicetr
sudo dscl . -passwd /Users/bucelicetr $1
sudo dscl . -passwd /Users/bucelicetr $1
sudo createhomedir -c -u bucelicetr > /dev/null
sudo dscl . -append /Groups/admin GroupMembership username

#Enable VNC
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes 

echo $2 | perl -we 'BEGIN { @k = unpack "C*", pack "H*", "1734516E8BA8C5E2FF1C39567390ADCA"}; $_ = <>; chomp; s/^(.{8}).*/$1/; @p = unpack "C*", $_; foreach (@k) { printf "%02X", $_ ^ (shift @p || 0) }; print "\n"' | sudo tee /Library/Preferences/com.apple.VNCSettings.txt

#Start VNC/reset changes
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

#install ngrok
brew install --cask anydesk

#configure ngrok and start it
echo my_new_password| sudo /Applications/AnyDesk.app/Contents/MacOS/AnyDesk --set-password
echo AnyDesk ID is: /Applications/AnyDesk.app/Contents/MacOS/AnyDesk --get-id
