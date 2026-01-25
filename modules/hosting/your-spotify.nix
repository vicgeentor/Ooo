{
  flake.modules.nixos.your-spotify = nixosArgs: {
    age.secrets.your-spotify.file = ../../_secrets/your-spotify.age;
    services.your_spotify = {
      enable = true;
      enableLocalDB = true;
      spotifySecretFile = nixosArgs.config.age.secrets.your-spotify.path;
      settings = {
        SPOTIFY_PUBLIC = "11ce6df3ad974ebdb6c4d3c41728475b";
        API_ENDPOINT = "https://apispoti.vicgeentor.nl"; # port 8080
        CLIENT_ENDPOINT = "https://spoti.vicgeentor.nl"; # port 8081
        PORT = 8080;
      };
    };
    services.nginx.virtualHosts."spoti.vicgeentor.nl" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 8081;
        }
      ];
      root = nixosArgs.config.services.your_spotify.clientPackage;
      locations."/".extraConfig = ''
        add_header Content-Security-Policy "frame-ancestors 'none';" ;
        add_header X-Content-Type-Options "nosniff" ;
        try_files $uri $uri/ /index.html ;
      '';
    };
  };
}
