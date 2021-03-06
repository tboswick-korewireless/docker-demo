param(
	[string] $version = "0.0.0"
)

$loc = Get-Location

cd ..

docker build -f webservice.dockerfile -t demo-webservice:$version-dev --target web-service-dev --add-host shop.docker.demo:127.0.0.1 --add-host auth.docker.demo:127.0.0.1 .
docker build -f authservice.dockerfile -t demo-authservice:$version-dev --target auth-service-dev .
docker build -f shopservice.dockerfile -t demo-shopservice:$version-dev --target shop-service-dev .

cd $loc
