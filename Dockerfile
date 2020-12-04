FROM mcr.microsoft.com/dotnet/core/sdk:3.1.401-alpine3.12 AS build-env
COPY . /app
WORKDIR /app
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.7-alpine3.12
WORKDIR /app
COPY --from=build-env /app/out .
RUN sed -e "s/%PORT%/$PORT/g" /app/out/static/vault.bak.json > /app/out/static/vault.json
ENTRYPOINT ["dotnet", "Dummy.Web.dll"]
