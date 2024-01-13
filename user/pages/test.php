<?php
    // $pubKey = "-----BEGIN PUBLIC KEY-----
    // MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCljPMs5W7w4fGIS8TXmvGFnnR+
    // 8CmUhY6KLXxpRwCd1SSyGzlyVTU+TmHhFDnReQCpSu0NaSrDrr5ehLPjSmeUZCNu
    // 1Vki69r9GrSM35fIq7eAwklsFu2HGjUfZeLbdIQ436tapp6Hihc9H/Y29B7DbnK2
    // 76UReV6w9zSK/+Wq8QIDAQAB
    // -----END PUBLIC KEY-----";

$pubKey = '-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCljPMs5W7w4fGIS8TXmvGFnnR+
8CmUhY6KLXxpRwCd1SSyGzlyVTU+TmHhFDnReQCpSu0NaSrDrr5ehLPjSmeUZCNu
1Vki69r9GrSM35fIq7eAwklsFu2HGjUfZeLbdIQ436tapp6Hihc9H/Y29B7DbnK2
76UReV6w9zSK/+Wq8QIDAQAB
-----END PUBLIC KEY-----
';

    $priKey = "-----BEGIN PRIVATE KEY-----
MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKWM8yzlbvDh8YhL
xNea8YWedH7wKZSFjootfGlHAJ3VJLIbOXJVNT5OYeEUOdF5AKlK7Q1pKsOuvl6E
s+NKZ5RkI27VWSLr2v0atIzfl8irt4DCSWwW7YcaNR9l4tt0hDjfq1qmnoeKFz0f
9jb0HsNucrbvpRF5XrD3NIr/5arxAgMBAAECgYAop4p4Ngeeg/3qeKDoSZaSN61o
FtY/MOUmLbFlsRgHqnYOfv0GhMJEgL8spOjl9g8hg9Le/jqQP3NkhrYeVQFGXHdO
tBnZP03oYfwNTIsH01nx0fD90+GpXFtXbSLNA1pRCgjDS+rwJzR6AMEQ5dTO45/P
lIXe6hixcaI7PiLCIQJBANZiWS9VZ3Oi3U6tzw24rWCwn1sG0eDj5s2hiyyaU87O
3UTyNF1HbS5PGf6Z1WkAsQgN1tlJDWbtopO2BYFBdIUCQQDFr9rmLD2hZhlfWIta
0lf8hAvgKzky9bklFdNFDPEKqXw9MiU5z8z8nmk6EAj+SRqBZGkqJ+o9hdZkdCsT
do59AkBeTiMHRF1eq80IWELVuWBjQS7IXwaiE/6qhB5xv22QcsU5GAZa5hmsHlXD
/q23I/u8HEJfkNgZZ/11VsOzKTT1AkBbZDNU2fscFLGCLNMwB7J5oSpEVnc5IfSY
OoDTmWoOPdCcEgS3t2PTHgETwLoHpRBF5X/g51cZXjiBdFs9wj+ZAkAB2meoT6iU
mkC3j1jNZ53Mi9CUzRCZNaFCx9Ft8sZBIubGxBCRsQ6RZFy+1HyJ3aKH2en7BHcn
NPI4LERv6Zet
-----END PRIVATE KEY-----
";

    $message = "Hello";  
    $encryption = "";
    $msg="";

    openssl_public_encrypt($message,$encryption,$pubKey);

    $encryption = base64_encode($encryption);
    echo $encryption;

    openssl_private_decrypt(base64_decode($encryption),$msg,$priKey);
    echo $msg;


?>