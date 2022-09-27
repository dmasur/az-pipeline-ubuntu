# Ubuntu 22.04 Azure Pipelines Agent in Docker
This is a Dockerfile + start.sh for Azure Piplines Agent with some preinstalled stuff.

## Preinstalled:
- OpenJDK 11 
- OpenJDK 8
- Dotnet 6

## License:
[GNU General Public License v3.0](https://raw.githubusercontent.com/chrizzo84/azpipeline-ubuntu2204/main/LICENSE)

## HowTo:
Just build with docker build.
Run it with
```
docker run -e AZP_URL=https://dev.azure.com/<OranizationName> -e AZP_TOKEN=<YourPersonalAccessToken> -e AZP_AGENT_NAME=<AgentName> -e AZP_POOL=<PoolName> yourdockerimagename:yourtag
```
