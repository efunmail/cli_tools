## Set-up

- Keyboard

```sh
setxkbmap -option caps:escape
```

- Internet / Network / WiFi

```sh
nmtui
```

## Hardware

- Battery

```sh
upower -i $(upower -e | grep BAT) |less
```
