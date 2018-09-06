from typing import NamedTuple, Optional


class Response(NamedTuple):
    status_code: int
    data: str


def request() -> Optional[Response]:
    return Response(100, '33')

# =======================

