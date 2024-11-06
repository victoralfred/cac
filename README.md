# Loot Learn IaC platofrm
## Configuration
To accommodate the need to add configuration to agents, you will have to bind mount the configuration file e.g; ```service/*.toml``` with ```ro```
permission.
For example, to add environment variables to the Audio agent,
```yaml
audio_agent/agent.toml
```
Modify ```web-rtc-server``` container service to use the mounted configuration file.
```yaml
web-rtc-server:
  image: vicdonxp/loot-learn-local-v1
  volumes:
    ...
    - ${XDG_CONFIG_HOME:-$HOME/.config}/owt/audio_agent/agent.toml:/home/owt/audio_agent/agent.toml:ro
 ```