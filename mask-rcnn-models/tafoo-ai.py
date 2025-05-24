from flask import Flask, request, jsonify
import requests
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)


API_KEY = os.getenv("OPENROUTER_API_KEY", "")

@app.route('/adverts-instruct', methods=['POST'])
def adverts_instruct():
    try:
        data = request.json
        adverts_details = data.get('advertsDetails')
        return_full_response = data.get('full_response', False)

        if not adverts_details:
            return jsonify({"error": "'advertsDetails' is required."}), 400

        # Araç bilgilerini düzgün bir metin haline getir
        advertsInstruct = "Aşağıdaki araç özelliklerini değerlendir ve kısa bir özet oluştur:\n"
        for key, value in adverts_details.items():
            advertsInstruct += f"- {key}: {value}\n"

        # OpenRouter API'ye istek yap
        headers = {
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        }
        payload = {
            "model": "google/learnlm-1.5-pro-experimental:free",
            "messages": [
                {"role": "user", "content": advertsInstruct}
            ]
        }
        response = requests.post("https://openrouter.ai/api/v1/chat/completions", headers=headers, json=payload)

        # Yanıtı işleyin
        if response.status_code == 200:
            result = response.json()
            if return_full_response:
                return jsonify({"full_response": result}), 200
            else:
                ai_response = result.get('choices', [{}])[0].get('message', {}).get('content', 'No response')
                return jsonify({"response": ai_response}), 200
        else:
            return jsonify({
                "error": "OpenRouter API error",
                "status_code": response.status_code,
                "details": response.json()
            }), response.status_code
    except Exception as e:
        return jsonify({"error": "An error occurred", "details": str(e)}), 500


@app.route('/ask-ai', methods=['POST'])
def ask_ai():
    try:
        # İstek verilerini alın
        data = request.json
        user_message = data.get('message')
        return_full_response = data.get('full_response', False)  # İsteğe bağlı olarak tam yanıtı döndür

        if not user_message:
            return jsonify({"error": "'message' is required."}), 400

        summarized_message = f"Maksimum bir paragraf olacak şekilde bu soruyu cevapla: {user_message}"

        # OpenRouter API'ye istek yap
        headers = {
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        }
        payload = {
            "model": "google/learnlm-1.5-pro-experimental:free",
            "messages": [
                {"role": "user", "content": summarized_message}
            ]
        }
        response = requests.post("https://openrouter.ai/api/v1/chat/completions", headers=headers, json=payload)

        # Yanıtı işleyin
        if response.status_code == 200:
            result = response.json()
            if return_full_response:
                return jsonify({"full_response": result}), 200
            else:
                ai_response = result.get('choices', [{}])[0].get('message', {}).get('content', 'No response')
                return jsonify({"response": ai_response}), 200
        else:
            return jsonify({
                "error": "OpenRouter API error",
                "status_code": response.status_code,
                "details": response.json()
            }), response.status_code
    except Exception as e:
        return jsonify({"error": "An error occurred", "details": str(e)}), 500

if __name__ == '__main__':
    # Flask uygulamasını çalıştır
    app.run(host='0.0.0.0', port=8000)
