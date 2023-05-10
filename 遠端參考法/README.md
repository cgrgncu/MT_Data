# 遠端參考法(Remote reference)
+ 整理撰寫: HsiupoYeh
+ 更新日期: 2023-05-10
+ 重要博士論文: 
  + Gamble, T.D., 1978, Remote Reference Magnetotellurics with Squids Ph.D. thesis, University of California, Berkeley, LBL-8062
  ```
  遠端參考法發明人的博士論文。想學會細節請參考這本共計132頁的博士論文，內容包含遠端參考法計算、誤差估計。會比期刊論文更詳細。
  ```
+ 重要期刊論文:
  + Gamble, T. D., Goubau, W. M., & Clarke, J. (1979). Magnetotellurics with a remote magnetic reference. Geophysics, 44(1), 53-68.
  + Gamble, T. D., Goubau, W. M., & Clarke, J. (1979). Error analysis for remote reference magnetotellurics. Geophysics, 44(5), 959-968.
  + Bhattacharya, B. B. (2002). How remote can the far remote reference site for magnetotelluric measurements be. Journal of Geophysical Research Solid Earth, 107(B6), ETG-1.

### Bhattacharya(2002) 整理
+ Bhattacharya，音譯:巴塔查里亞
+ 遠端參考法技術(Remote reference)，簡稱RR法。
+ 目的是用來降低本地觀測電場與磁場的雜訊造成的阻抗估算偏差。
+ RR法只在本地站的噪聲與遠端站的噪聲為uncorrelated雜訊的時候有效。
  ```
  討論:
  1. RR法沒有提到距離限制!
  2. RR法不會降低correlated雜訊，因為此方法假設correlated的都是不是雜訊，是有效訊號。uncorrelated都是雜訊。
  ```
+ 測試的遠端參考站距離本地基站80、115、215[km]，分布在各種不同的地質環境中。
+ 本篇文章研究結果表示，非常遠的距離(215公里)的遠端參考站對所有的頻段都有很棒的效果。 
+ Introduction提到:

  ```
  Until now, relatively little information has been available about the maximum distance up to which the far RR has been found to be effective. The initial work of Gamble et al. [1979a] was for a separation of 4.8 km only. Goubau et al. [1984, p. 432] states that ‘‘sources of noise are not well understood, but general experience has indicated that a separation of several kilometres between the base and reference stations is sufficient to ensure that the data are unbiased.’’ Jones et al. [1989] suggested that to minimize the bias errors, RR should be undertaken. They have reported RR measure?ments with 135 km separation between stations for MT measure?ments over 5-day intervals. Chave and Smith [1994] suggest that greater attention be given to galvanic distortion of magnetic fields during MT surveys. In Japan, Tarakura et al. [1994, p. 24] find that ‘‘the separation between a measurement site and a reference site is usually at most 20 km.’’ However, they carried out a field experi?ment in Higosi-Kubiki area, Niligata prefecture, where the noise could be removed sufficiently only when the reference site was 147 km away from the measurement site. Larsen et al. [1996] used a relatively clean MT site in central California ?100 km from the local site to test their code. Egbert [1997] used a remote site at a distance of 100 km from the local site while using his robust processing approach based on multivariate statistical methods
  ```
  + Gamble et al. [1979a] 應用RR法，遠端站距離本地基站4.8[km]。
  + Goubau et al. [1984, p. 432] 在文章說: 即使不理解雜訊的狀況，實務經驗中，本地基站與遠端參考站只要間隔幾公里就可以保證RR法有效。
  + Jones et al. [1989] 建議要使用RR法，在其研究中選擇了遠端站距離本地基站135[km]，觀測時間5天。
  + Tarakura et al. [1994, p. 24] 在文章說: 遠端站距離本地基站通常為20[km]。但他們的實際研究在新潟附近的「樋越」到「北原」之間。只有用到147[km]的遠端參考站才能有效修正資料。
  + Larsen et al. [1996] 使用距離100[km]相對乾淨的測站來測試RR法的相關程式碼。
  + Egbert [1997] 使用距離100[km]的遠端參考站來測試其RR法相關程式碼。
+ 本文章(Bhattacharya [2002]) 遠端站距離本地基站80、115、215[km]。在中緯度地區、磁場均勻。頻寬範圍30~0.00055[Hz]。
    + 均勻磁場意味著源磁場的波長比站點間隔長。
    + 高緯度不滿足平面電磁波假設。 
    ```
    討論:
    我覺得緯度差太多的地方就不適合RR法。但怎樣算差太多我也不知道。
    ```
    + 3個主要因素影響RR法效果:
      + 本地基站與遠端站的噪聲。
      + 本地基站與遠端站的有效訊號一致性。
      + 本地基站與遠端站的噪聲一致性。
    + 研究指出: 80、115[km]在dead band不是很平滑，215[km]對所有頻段都有好效果。
