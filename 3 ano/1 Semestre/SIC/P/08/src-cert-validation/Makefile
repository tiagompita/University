all: validity_check trusted_certificates certification_path cert_path_validation

validity_check: validity_check.o load_certificate.o valid_certificate.o
	$(CC) -o $@ $^ -lcrypto

trusted_certificates: trusted_certificates.o load_certificates.o load_certificate.o valid_certificate.o
	$(CC) -o $@ $^ -lcrypto

certification_path: certification_path.o load_certificate.o build_cert_path.o get_ca_issuers_url.o get_issuer_cert.o
	$(CC) -o $@ $^ -lcrypto -lcurl

cert_path_validation: cert_path_validation.o validate_certification_chain.o load_certificate.o build_cert_path.o get_ca_issuers_url.o get_issuer_cert.o
	$(CC) -o $@ $^ -lcrypto -lcurl

clean:
	-rm validity_check trusted_certificates certification_path cert_path_validation
	-rm *.o
