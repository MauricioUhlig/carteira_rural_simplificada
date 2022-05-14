#!/bin/bash
# Criação do SDK
dotnet new classlib -n api -o uhlig.sdk.api 
dotnet new classlib -n domain -o uhlig.sdk.domain 
dotnet new classlib -n service -o uhlig.sdk.service
dotnet new classlib -n infra.data -o uhlig.sdk.infra.data
dotnet new classlib -n infra.crosscutting -o uhlig.sdk.infra.crosscutting

# Criando referencias
dotnet add sdk/uhlig.sdk.api/api.csproj reference sdk/uhlig.sdk.domain/domain.csproj 
dotnet add sdk/uhlig.sdk.api/api.csproj reference sdk/uhlig.sdk.service/service.csproj 

dotnet add sdk/uhlig.sdk.infra.crosscutting/infra.crosscutting.csproj reference sdk/uhlig.sdk.domain/domain.csproj 
dotnet add sdk/uhlig.sdk.infra.crosscutting/infra.crosscutting.csproj reference sdk/uhlig.sdk.service/service.csproj 
dotnet add sdk/uhlig.sdk.infra.crosscutting/infra.crosscutting.csproj reference sdk/uhlig.sdk.infra.data/infra.data.csproj 

dotnet add sdk/uhlig.sdk.infra.data/infra.data.csproj reference sdk/uhlig.sdk.domain/domain.csproj 

dotnet add sdk/uhlig.sdk.service/service.csproj reference sdk/uhlig.sdk.domain/domain.csproj 
dotnet add sdk/uhlig.sdk.service/service.csproj reference sdk/uhlig.sdk.infra.data/infra.data.csproj 

# Criação da API
dotnet new webapi -n api -o uhlig.carteira.api 
dotnet new classlib -n domain -o uhlig.carteira.domain 
dotnet new classlib -n service -o uhlig.carteira.service
dotnet new classlib -n infra.data -o uhlig.carteira.infra.data
dotnet new classlib -n infra.crosscutting -o uhlig.carteira.infra.crosscutting

# Criando referencias
dotnet add src/uhlig.carteira.api/api.csproj reference src/uhlig.carteira.domain/domain.csproj 
dotnet add src/uhlig.carteira.api/api.csproj reference src/uhlig.carteira.service/service.csproj 

dotnet add src/uhlig.carteira.infra.crosscutting/infra.crosscutting.csproj reference src/uhlig.carteira.domain/domain.csproj 
dotnet add src/uhlig.carteira.infra.crosscutting/infra.crosscutting.csproj reference src/uhlig.carteira.service/service.csproj 
dotnet add src/uhlig.carteira.infra.crosscutting/infra.crosscutting.csproj reference src/uhlig.carteira.infra.data/infra.data.csproj 

dotnet add src/uhlig.carteira.infra.data/infra.data.csproj reference src/uhlig.carteira.domain/domain.csproj 

dotnet add src/uhlig.carteira.service/service.csproj reference src/uhlig.carteira.domain/domain.csproj 
dotnet add src/uhlig.carteira.service/service.csproj reference src/uhlig.carteira.infra.data/infra.data.csproj 


dotnet sln add src/*
dotnet sln add sdk/*