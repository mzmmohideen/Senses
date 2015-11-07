import pdfcrowd
from django.http import HttpResponse

def generate_pdf_view(request):
    try:
        # create an API client instance
        client = pdfcrowd.Client("username", "apikey")

        # convert a web page and store the generated PDF to a variable
        # pdf = client.convertURI("http://www.google.com")
        pdf = client.convertHtml("<head></head><body>My HTML Layout</body>")
        # pdf = client.convertFile("/path/to/MyLayout.html")

         # set HTTP response headers
        response = HttpResponse(mimetype="application/pdf")
        response["Cache-Control"] = "max-age=0"
        response["Accept-Ranges"] = "none"
        response["Content-Disposition"] = "attachment; filename=google_com.pdf"

        # send the generated PDF
        response.write(pdf)
    except pdfcrowd.Error, why:
        response = HttpResponse(mimetype="text/plain")
        response.write(why)
    return response