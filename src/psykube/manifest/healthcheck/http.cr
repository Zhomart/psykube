class Psykube::Manifest::Healthcheck::Http
  Manifest.mapping({
    path:    {type: String, default: "/"},
    port:    {type: String | UInt16, default: "default"},
    host:    String?,
    scheme:  String?,
    headers: {type: Hash(String, String), nilable: true},
  })
end
