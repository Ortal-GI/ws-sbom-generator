FROM python:3.9-slim-buster

ARG version
ENV SPDX_TOOLS_WHL="spdx_tools-0.7.0a3_ws-py3-none-any.whl"
ENV SBOM_GENERATOR_WHL="ws_sbom_generator-$version-py3-none-any.whl"

VOLUME /opt/ws-sbom-generator/sbom_generator/resources
VOLUME /opt/ws-sbom-generator/sbom_generator/output

COPY $SPDX_TOOLS_WHL dist/$SBOM_GENERATOR_WHL ./

RUN python3 -m pip install --upgrade pip
RUN pip3 install $SPDX_TOOLS_WHL $SBOM_GENERATOR_WHL

CMD sbom_generator -o /opt/ws-sbom-generator/sbom_generator/output -e /opt/ws-sbom-generator/sbom_generator/resources/sbom_extra.json

