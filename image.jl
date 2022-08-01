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

data = reshape(raw, :)

url = "https://anselbrandt.github.io/assets/cat.jpg"

download(url, "cat.jpg")

cat = load("cat.jpg")

smallcat = imresize(cat, (40, 40))

smallcatflat = smallcat'[:]

smallcatraw = (rawview ∘ channelview)(smallcatflat)

smallcatdata = reshape(smallcatraw, :)

magic = UInt32(2051)
images = UInt32(1)
rows = UInt32(40)
cols = UInt32(40)

header = [magic; images; rows; cols]

idxfile = Any[header; smallcatdata]
