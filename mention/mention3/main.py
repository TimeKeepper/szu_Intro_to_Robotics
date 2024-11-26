import cv2
def mention():
    # 将head.jpg转为灰度图
    img = cv2.imread('/home/wenjiu/project/szu_Intro_to_Robotics/mention/mentionx/test.jpg')
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # 使用OTSU算法转为二值图
    _, img = cv2.threshold(img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)

    # 提取轮廓
    contours, _ = cv2.findContours(img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # 画出轮廓
    cv2.drawContours(img, contours, -1, (0, 0, 0), 1)

    # 显示图片
    cv2.imshow('head', img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

if __name__ == '__main__':
    mention()
