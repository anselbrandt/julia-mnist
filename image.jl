using Images

red = RGB{N0f8}(1, 0, 0)

green = RGB{N0f8}(0, 1, 0)

blue = RGB{N0f8}(0, 0, 1)

black = RGB{N0f8}(0, 0, 0)

pic = [
    red green
    blue black]

flat = pic'[:]

raw = rawview(channelview(flat))

for pixel in raw
    println(pixel)
end

data = reshape(raw, :)

url = "https://anselbrandt.github.io/assets/cat.jpg"

download(url, "cat.jpg")

cat = load("cat.jpg")

catflat = cat'[:]

catraw = (rawview ∘ channelview)(catflat)

catdata = reshape(catraw, :)
