# myenv

## CLI interface for [Pritunl VPN Client](https://client.pritunl.com/)

### Build

`
make linux
`

### Connect to profiles already imported in pritunl client

![Profile Name](screenshots/profile.png?raw=true "Profile Name")

![User Name](screenshots/username.png?raw=true "User Name")

![Password](screenshots/password.png?raw=true "Password")

#### To Connect to the above profile

`
myenv -c profileName vpnUser "vpnPassword"
`