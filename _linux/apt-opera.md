## Opera Browser

- [*"How to Install Opera Browser on Debian 12 or 11"*](https://linuxcapable.com/how-to-install-opera-browser-on-debian-linux/)

```sh
sudo apt install  software-properties-common apt-transport-https curl ca-certificates

curl -fSsL https://deb.opera.com/archive.key | gpg --dearmor | sudo tee /usr/share/keyrings/opera.gpg > /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free | sudo tee /etc/apt/sources.list.d/opera.list

sudo apt update
sudo apt install opera-stable
```
