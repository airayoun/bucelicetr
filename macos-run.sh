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

#install ngrok
brew install --cask anydesk

#configure ngrok and start it
echo mynewpassword | sudo anydesk --set-password
echo AnyDesk ID is: anydesk --get-id
