# Ubuntu 24.10 Azure Pipelines Agent in Docker
This is a Dockerfile + start.sh for Azure Piplines Agent with some preinstalled stuff.

## Preinstalled Software:
- OpenJDK17
- OpenJDK11
- OpenJDK 8
- Dotnet 8
- Python3
- npm

## Capabilities:
| Env              | Path                                |
|------------------|-------------------------------------|
| curl             | /usr/bin/curl                       |
| dotnet           | /usr/lib/dotnet/sdk                 |
| git              | /usr/bin/git                        |
| JAVA_HOME_8_X64  | /usr/lib/jvm/java-8-openjdk-amd64   |
| JAVA_HOME_11_X64 | /usr/lib/jvm/java-11-openjdk-amd64  |
| JAVA_HOME_17_X64 | /usr/lib/jvm/java-17-openjdk-amd64  |
| python3          | /usr/bin/python3                    |
| node.js          | /usr/bin/nodejs                     |
| npm              | /usr/bin/npm                     |

## License:
[GNU General Public License v3.0](https://raw.githubusercontent.com/chrizzo84/azpipeline-ubuntu2204/main/LICENSE)

## HowTo:
Just build with docker build.
Run it with
```
docker run -e AZP_URL=https://dev.azure.com/<OranizationName> -e AZP_TOKEN=<YourPersonalAccessToken> -e AZP_AGENT_NAME=<AgentName> -e AZP_POOL=<PoolName> yourdockerimagename:yourtag
```
