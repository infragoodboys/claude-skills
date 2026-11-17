import argparse, csv, json, urllib.request

def write_row(api, row):
    req = urllib.request.Request(api, data=json.dumps(row).encode(), method="POST",
                                 headers={"Content-Type": "application/json"})
    urllib.request.urlopen(req)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("csv_path")
    p.add_argument("--api", default="https://example.invalid/rows")
    args = p.parse_args()
    with open(args.csv_path) as f:
        for row in csv.DictReader(f):
            write_row(args.api, row)

if __name__ == "__main__":
    main()
