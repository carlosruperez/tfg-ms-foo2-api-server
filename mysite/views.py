import os
from rest_framework.decorators import api_view
from rest_framework.response import Response
from poetry.core.factory import Factory


@api_view(["GET"])
def get_version(request):
    pyproject_path = f"{os.getcwd()}/pyproject.toml"
    factory = Factory()
    poetry = factory.create_poetry(pyproject_path)

    return Response({"version": str(poetry.package.version)})

