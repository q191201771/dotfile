$cp iterm2-send-zmodem.sh iterm2-recv-zmodem.sh /usr/local/bin/

Client Preferences -> Profiles -> Advanced -> Triggers -> Edit

```
\*\*B0100    Run Silent Coprocess    /usr/local/bin/iterm2-send-zmodem.sh
\*\*B00000000000000 Run Silient Coprocess /usr/local/bin/iterm2-recv-zmodem.sh
```

