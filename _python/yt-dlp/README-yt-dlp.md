## Intro

https://github.com/yt-dlp/yt-dlp

## Run

```sh
python3 yt-dlp URL

python3 yt-dlp URL -F  # // SHOW video/audio formats
python3 yt-dlp URL -s  # // SIMULATE (ie. dry-run)
```

### 1440p

- `[height=1440]`

```sh
python3 yt-dlp -P __ID/_1440p URL -f "bestvideo[ext=mp4][height=1440]+bestaudio[ext=m4a]"

# // Example: URL == https://www.youtube.com/@__ID/videos
```
