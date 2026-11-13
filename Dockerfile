FROM registry.access.redhat.com/ubi9/python-39@sha256:447a4c9f6ead4f063bed8778793ac9e972004e5a55d103b375de83c885887e50

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
