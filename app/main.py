from flask import Flask
import emoji
import pyjokes

app = Flask(__name__)


@app.route("/")
def jokes():
    return pyjokes.get_joke()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=5000)
    parser.add_argument("--host", default="127.0.0.1")
    args = parser.parse_args()
    app.run(port=args.port, host=args.host)
