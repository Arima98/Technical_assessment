# upload_graph_cmd.py
import argparse, pathlib, mimetypes, requests, sys

def upload(url: str, file_path: str, token: str, ctype: str | None = None) -> int:
    p = pathlib.Path(file_path.strip('"'))
    if not p.is_file():
        print(404, end="")  
        return 1

   
    if not ctype:
        ctype, _ = mimetypes.guess_type(str(p))
        if not ctype:
            if p.suffix.lower() == ".xlsx":
                ctype = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            else:
                ctype = "application/octet-stream"

    headers = {
        "Authorization": f"Bearer {token.strip()}",
        "Content-Type": ctype
    }

    with p.open("rb") as f:
        resp = requests.put(url, headers=headers, data=f)

    # imprime SOLO el código
    print(resp.status_code, end="")
    return 0 if resp.ok else 2

def main():
    ap = argparse.ArgumentParser(description="PUT bytes to Microsoft Graph /content")
    ap.add_argument("--url",   required=True, help="URL completa de Graph que termina en :/content")
    ap.add_argument("--file",  required=True, help="Ruta del archivo a subir")
    ap.add_argument("--token", required=True, help="Access token (solo el valor, sin la palabra Bearer)")
    ap.add_argument("--ctype", required=False, help="Content-Type opcional (si no, se infiere)")
    args = ap.parse_args()
    sys.exit(upload(args.url, args.file, args.token, args.ctype))

if __name__ == "__main__":
    main()




    