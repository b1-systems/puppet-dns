define dns::record::ns (
  $zone,
  $data,
  $ttl = '',
  $ptr = false,
  $record = 'NS',
  $host = $name ) {

  $alias = "${host},NS,${zone}"

  dns::record { $alias:
    zone   => $zone,
    record => $record,
    host   => $host,
    ttl    => $ttl,
    data   => $data
  }

}
